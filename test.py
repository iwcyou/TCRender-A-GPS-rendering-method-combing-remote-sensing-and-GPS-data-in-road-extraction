import os
from scipy.stats import wasserstein_distance
import cv2
import numpy as np
import csv
from tqdm import tqdm

weights_dirs = ["weights_sz_v1", "weights_sz_v2", "weights_sz_v3"]
models = ["unet", "resunet", "deeplabv3+", "linknet", "dlink34_1d", "dlink34"]
methods = ["_gpsimage_only_gaussian_ltqs_log__", "_sat_gpsimage_gaussian_ltqs_log__"]

mask_path = "./datasets/dataset_sz_grid/test/mask"
csv_file_path = "./emd.csv"

for weights_dir in weights_dirs:
    print(f"Calculating Wasserstein distance for {weights_dir}:\n")
    for model in models:
        print(f"Model: {model}\n")
        for method in methods:
            print(f"Method: {method}\n")
            folder_path = f"./{weights_dir}/{model}{method}"
            pred_path = os.path.join(folder_path, "prediction")
            sum_distance = 0
            for filename in tqdm(os.listdir(pred_path)):
                if filename.endswith(".png"):
                    pred_image = cv2.imread(os.path.join(pred_path, filename), cv2.IMREAD_GRAYSCALE)
                    mask_image = cv2.imread(os.path.join(mask_path, f"{filename[:-4]}_mask.png"), cv2.IMREAD_GRAYSCALE)
                    distance = np.zeros(pred_image.shape[0])
                    for i, row in enumerate(pred_image):
                        if row.sum() == 0 and mask_image[i].sum() == 0:
                            distance[i] = 0
                        elif row.sum() == 0 and mask_image[i].sum() != 0:
                            distance[i] = wasserstein_distance([0], np.arange(1024), None, mask_image[i])
                        elif row.sum() != 0 and mask_image[i].sum() == 0:
                            distance[i] = wasserstein_distance(np.arange(1024), [0], row, None)
                        else:
                            # distance[i] = wasserstein_distance(np.arange(row.shape[0]), np.arange(mask_image[i].shape[0]), row, mask_image[i])
                            distance[i] = wasserstein_distance(np.arange(1024), np.arange(1024), row, mask_image[i])
                    sum_distance += np.mean(distance)
            average_distance = sum_distance / len(os.listdir(pred_path))
            # Write average_distance to CSV file
            with open(csv_file_path, mode='a', newline='') as file:
                writer = csv.writer(file)
                writer.writerow([folder_path, average_distance])

            print(f'{folder_path}: {average_distance}')
