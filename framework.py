import torch
import torch.nn as nn
from torch.autograd import Variable
import os
from tqdm import tqdm
from utils.metrics import IoU
from loss import dice_bce_loss
from torch.utils.tensorboard import SummaryWriter

class Solver:
    def __init__(self, net, optimizer, loss=dice_bce_loss, metrics=IoU):
        self.net = net.cuda() #调用model.cuda()，可以将模型加载到GPU上去。但建议使用model.to(device)的方式，这样可以显示指定需要使用的计算资源，特别是有多个GPU的情况下。
        self.net = torch.nn.DataParallel(
            self.net, device_ids=list(range(torch.cuda.device_count())) #多个显卡共同计算
        )
        self.optimizer = optimizer
        self.loss = loss()
        self.metrics = metrics()
        self.old_lr = optimizer.param_groups[0]["lr"] #？？？

    def set_input(self, img_batch, mask_batch=None, img_id=None): #输入图片
        self.img = img_batch
        self.mask = mask_batch
        self.img_id = img_id

    def forward(self):
        self.img = self.img.cuda()
        if self.mask is not None:
            self.mask = self.mask.cuda()

    def optimize(self): #优化器
        self.net.train()
        self.forward()
        self.optimizer.zero_grad()
        # print(self.img.shape)
        pred = self.net.forward(self.img)
        loss = self.loss(self.mask, pred)
        loss.backward() 
        self.optimizer.step() 
        metrics = self.metrics(self.mask, pred)
        return pred, loss.item(), metrics

    def save_weights(self, path): #保留模型参数
        torch.save(self.net.state_dict(), path)

    def load_weights(self, path): #加载模型参数
        self.net.load_state_dict(torch.load(path))

    def update_lr(self, new_lr, factor=False): #更新学习率
        if factor:
            new_lr = self.old_lr / new_lr
        for param_group in self.optimizer.param_groups:
            param_group["lr"] = new_lr

        print("==> update learning rate: %f -> %f" % (self.old_lr, new_lr))
        self.old_lr = new_lr

    def test_batch(self):
        self.net.eval() #评估模式
        with torch.no_grad():
            self.forward()
            pred = self.net.forward(self.img)
            loss = self.loss(self.mask, pred)
            metrics = self.metrics(self.mask, pred)
            pred = pred.cpu().data.numpy()
        return pred, loss.item(), metrics

    def pred_one_image(self, image):
        self.net.eval()
        image = image.cuda().unsqueeze(0)
        pred = self.net.forward(image)
        return pred.cpu().data.numpy().squeeze(1).squeeze(0) #？？？


class Trainer:
    def __init__(self, *args, **kwargs):
        self.solver = Solver(*args, **kwargs)

    def set_train_dl(self, dataloader): #装载训练集
        self.train_dl = dataloader

    def set_validation_dl(self, dataloader): #装载验证集
        self.validation_dl = dataloader

    def set_test_dl(self, dataloader): #装载测试集
        self.test_dl = dataloader

    def set_save_path(self, save_path): #加载参数保存路径
        self.save_path = save_path

    def fit_one_epoch(self, dataloader, eval=False, writer=None):
        dataloader_iter = iter(dataloader) #将dataloader变成iterator
        epoch_loss = 0
        epoch_metrics = 0
        iter_num = len(dataloader_iter)
        progress_bar = tqdm(enumerate(dataloader_iter), total=iter_num) #进度条
        for i, (img, mask) in progress_bar:
            # writer.add_images("sat", img[:, :3, :, :], i)
            # writer.add_images("mask", mask, i)
            self.solver.set_input(img, mask)
            if eval:
                pred, iter_loss, iter_metrics = self.solver.test_batch()
            else:
                pred, iter_loss, iter_metrics = self.solver.optimize()
            # writer.add_images("pred", pred, i)
            
            epoch_loss += iter_loss
            epoch_metrics += iter_metrics
            progress_bar.set_description(
                f'iter: {i} loss: {iter_loss:.4f} metrics: {iter_metrics[3]:.4f}'
            )
        epoch_loss /= iter_num
        epoch_metrics /= iter_num
        return epoch_loss, epoch_metrics


    def fit(self, epochs, no_optim_epochs=10):
        writer = SummaryWriter("all_logs/logs")
        # writer = None

        val_best_metrics = 0
        test_best_metrics = 0
        val_best_loss = float("+inf") #无穷大
        test_best_loss = float("+inf") #无穷大
        no_optim = 0
        for epoch in range(1, epochs + 1):
            print(f"epoch {epoch}/{epochs}")

            print(f"training")
            train_loss, train_metrics = self.fit_one_epoch(self.train_dl, eval=False, writer=writer)

            print(f"validating")
            val_loss, val_metrics = self.fit_one_epoch(self.validation_dl, eval=True, writer=writer)

            print(f"testing")
            test_loss, test_metrics = self.fit_one_epoch(self.test_dl, eval=True, writer=writer)

            print('epoch finished')
            print(f'train_loss: {train_loss:.4f} train_metrics: {train_metrics}')
            print(f'val_loss: {val_loss:.4f} val_metrics: {val_metrics}')
            print(f'test_loss: {test_loss:.4f} val_metrics: {test_metrics}')
            print()
            writer.add_scalar("train_loss", train_loss, epoch)
            writer.add_scalar("train_metrics", train_metrics[3], epoch)
            writer.add_scalar("test_loss", test_loss, epoch)
            writer.add_scalar("test_metrics", test_metrics[3], epoch)

            #记录验证集的最优
            if val_metrics[3] > val_best_metrics:
                val_best_metrics = val_metrics[3]
                self.solver.save_weights(os.path.join(self.save_path,
                    f"epoch{epoch}_val{val_metrics[3]:.4f}_test{test_metrics[3]:.4f}.pth"))

            if val_loss < val_best_loss:
                no_optim = 0
                val_best_loss = val_loss
            else:
                no_optim += 1

            if no_optim > no_optim_epochs:
                if self.solver.old_lr < 1e-8:
                    print('early stop at {epoch} epoch')
                    break
                else:
                    no_optim = 0
                    self.solver.update_lr(5.0, factor=True) #更新学习率

        writer.close()


class Tester:
    def __init__(self, *args, **kwargs):
        self.solver = Solver(*args, **kwargs)

    def set_validation_dl(self, dataloader):
        self.validation_dl = dataloader

    def predict(self):
        pass