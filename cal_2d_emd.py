# Calculate 2D Wasserstein distance for every model
import numpy as np
from scipy.ndimage import distance_transform_edt
from scipy.optimize import linear_sum_assignment
from tqdm import tqdm
import os
import cv2
import argparse
import csv


def wasserstein_distance(image1, image2):
    # Compute the Euclidean distance transform of the binary images
    distance_map1 = distance_transform_edt(image1)
    distance_map2 = distance_transform_edt(image2)

    # Compute the cost matrix as the pairwise distances between non-zero pixels
    nonzero_indices1 = np.transpose(np.nonzero(image1))
    nonzero_indices2 = np.transpose(np.nonzero(image2))
    cost_matrix = np.linalg.norm(nonzero_indices1[:, None] - nonzero_indices2, axis=2)

    # Solve the assignment problem to find optimal pixel correspondences
    row_indices, col_indices = linear_sum_assignment(cost_matrix)

    # Calculate the Wasserstein distance
    wasserstein_dist = np.sum(cost_matrix[row_indices, col_indices] *
                              np.maximum(distance_map1[nonzero_indices1[row_indices, 0],
                                                        nonzero_indices1[row_indices, 1]],
                                         distance_map2[nonzero_indices2[col_indices, 0],
                                                        nonzero_indices2[col_indices, 1]]))
    return wasserstein_dist


parser = argparse.ArgumentParser()
parser.add_argument('--weight_dir', type=str, default='')
parser.add_argument('--model', type=str, default='')
parser.add_argument('--method', type=str, default='')
args = parser.parse_args()
mask_path = "datasets/dataset_sz_grid/sz_2d_emd/mask"
csv_file_path = "./emd.csv"

n = len(os.listdir(mask_path))


folder_path = f"./{args.weight_dir}/{args.model}{args.method}"
print(f"Calculating Wasserstein distance for {folder_path}:")
pred_path = os.path.join(folder_path, "prediction_transposed")
iter = tqdm(os.listdir(pred_path))
distance = 0
for filename in iter:
    if filename.endswith(".png"):
        pred_image = cv2.imread(os.path.join(pred_path, filename), cv2.IMREAD_GRAYSCALE)
        mask_image = cv2.imread(os.path.join(mask_path, f"{filename[:-4]}_mask.png"), cv2.IMREAD_GRAYSCALE)
        distance += wasserstein_distance(pred_image, mask_image)
        iter.set_description_str(f"Processing {filename}")
average_distance = distance / n
# Write average_distance to CSV file
with open(csv_file_path, mode='a', newline='') as file:
    writer = csv.writer(file)
    writer.writerow([folder_path, average_distance])
print(f'{folder_path}: {average_distance}')
print('Done!')
