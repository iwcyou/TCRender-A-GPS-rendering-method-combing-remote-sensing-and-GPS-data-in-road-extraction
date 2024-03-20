import torch
import torch.nn as nn
import numpy as np
from scipy.stats import wasserstein_distance


class IoU(nn.Module):
    def __init__(self, threshold=0.5):
        super(IoU, self).__init__()
        self.threshold = threshold

    # def forward(self, target, input):
    #     eps = 1e-10
    #     input_ = (input > self.threshold).data.float() # If the value of the pixel is greater than the threshold, then the pixel is 1, otherwise it is 0.
    #     target_ = (target > self.threshold).data.float()

    #     intersection = torch.clamp(input_ * target_, 0, 1)
    #     union = torch.clamp(input_ + target_, 0, 1)

    #     if torch.mean(intersection).lt(eps): #less than函数
    #         return torch.Tensor([0., 0., 0., 0., 0., 0.])
    #     else:
    #         acc = torch.mean((input_ == target_).data.float()) # accuracy
    #         iou = torch.mean(intersection) / torch.mean(union)
    #         recall = torch.mean(intersection) / torch.mean(target_)
    #         precision = torch.mean(intersection) / torch.mean(input_)
    #         f1 = 2 * recall * precision / (recall + precision) # F1-score
    #         #EMD
    #         real_mask = target_.cpu().numpy().flatten()
    #         predicted_mask = input_.cpu().numpy().flatten()
    #         emd = wasserstein_distance(real_mask, predicted_mask)

    #         return torch.Tensor([acc, recall, precision, iou, f1, emd])


    def forward(self, target, input):
        """calculate the EMD"""
        real_mask = target.flatten()
        predicted_mask = input.data.float().cpu().numpy().flatten()
        emd = wasserstein_distance(real_mask, predicted_mask)

        # return torch.Tensor([acc, recall, precision, iou, f1, emd])
        return torch.Tensor([0., 0., 0., 0., 0., emd])
