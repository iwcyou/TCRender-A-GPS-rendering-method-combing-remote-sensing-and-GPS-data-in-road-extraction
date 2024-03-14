import cv2
import os
import sys
# sys.path.append('..')

def transpose_image(input_path, output_path):
    # Read the input image
    img = cv2.imread(input_path)

    # Resize the image to 128x128 while maintaining aspect ratio
    resized_img = cv2.resize(img, (128, 128), interpolation=cv2.INTER_AREA)

    # Save the resized image
    cv2.imwrite(output_path, resized_img)

# Example usage:
path = "weights_sz_grid/dlink34_sat_gpsdata_count_direct__/prediction"
save_path = ""
for filename in os.listdir(path):
    if filename.endswith(".png"):
        input_image_path = os.path.join(path, filename)
        output_image_path = os.path.join(path, filename)
        transpose_image(input_image_path, output_image_path)
        print(f'Transposed: {input_image_path} -> {output_image_path}')
    break

print("Done!")
