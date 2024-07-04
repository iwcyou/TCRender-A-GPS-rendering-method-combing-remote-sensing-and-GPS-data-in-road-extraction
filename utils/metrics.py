import torch
import torch.nn as nn
import numpy as np
from scipy.stats import wasserstein_distance


class IoU(nn.Module):
    def __init__(self, threshold=0.5):
        super(IoU, self).__init__()
        self.threshold = threshold

    def forward(self, target, input):
        eps = 1e-10
        input_ = (input > self.threshold).data.float() # If the value of the pixel is greater than the threshold, then the pixel is 1, otherwise it is 0.
        target_ = (target > self.threshold).data.float()

        intersection = torch.clamp(input_ * target_, 0, 1)
        union = torch.clamp(input_ + target_, 0, 1)

        # #EMD
        # # Calculate the sum of all pixel values
        # sum_of_target = np.sum(target.data.float().cpu().numpy())
        # sum_of_input = np.sum(input.data.float().cpu().numpy())
        # # Normalize pixel values
        # normalized_target = target.data.float().cpu().numpy() / sum_of_target
        # normalized_input = input.data.float().cpu().numpy() / sum_of_input
        # # Optionally, you can convert the data type to ensure it's in floating point
        # normalized_target = normalized_target.astype('float32')
        # normalized_input = normalized_input.astype('float32')

        # emd = np.zeros(len(normalized_target))
        # for i in range(len(normalized_target)): # every batch calculate respectively
        #     real_target = normalized_target[i].flatten()
        #     predicted_mask = normalized_input[i].flatten()
        #     emd[i] = wasserstein_distance(real_target, predicted_mask)
        # emd = np.mean(emd)
        emd = 0

        if torch.mean(intersection).lt(eps): #less than函数
            return torch.Tensor([0., 0., 0., 0., 0., emd])
        else:
            acc = torch.mean((input_ == target_).data.float()) # accuracy
            iou = torch.mean(intersection) / torch.mean(union)
            recall = torch.mean(intersection) / torch.mean(target_)
            precision = torch.mean(intersection) / torch.mean(input_)
            f1 = 2 * recall * precision / (recall + precision) # F1-score

            return torch.Tensor([acc, recall, precision, iou, f1, emd])


    # def forward(self, target, input):
    #     """calculate the EMD"""
    #     # Calculate the sum of all pixel values
    #     sum_of_target = np.sum(target)
    #     sum_of_input = np.sum(input.data.float().cpu().numpy())
    #     # Normalize pixel values
    #     normalized_target = target / sum_of_target
    #     normalized_input = input.data.float().cpu().numpy() / sum_of_input

    #     # Optionally, you can convert the data type to ensure it's in floating point
    #     normalized_target = normalized_target.astype('float32')
    #     normalized_input = normalized_input.astype('float32')

    #     real_target = normalized_target.flatten()
    #     predicted_mask = normalized_input.flatten()
    #     emd = wasserstein_distance(real_target, predicted_mask)

    #     return torch.Tensor([acc, recall, precision, iou, f1, emd])
    #     # return torch.Tensor([0., 0., 0., 0., 0., emd])
