#训练sun的数据集

# #仅包含gps位置信息的数据集
# python train.py \
#     --model dlink34 \
#     --sat_dir datasets/dataset_time/train_val/image \
#     --mask_dir datasets/dataset_time/train_val/mask \
#     --test_sat_dir datasets/dataset_time/test/image_test \
#     --test_mask_dir datasets/dataset_time/test/mask \
#     --gps_dir datasets/dataset_time/GPS/patch \
#     \
#     --gps_type data


# #在gps中嵌入时间、速度、数量（log渲染）信息的数据集
# python train.py \
#     --model unet \
#     --sat_dir datasets/dataset_time/train_val/image \
#     --mask_dir datasets/dataset_time/train_val/mask \
#     --test_sat_dir datasets/dataset_time/test/image_test \
#     --test_mask_dir datasets/dataset_time/test/mask \
#     --gps_dir datasets/dataset_time/GPS/time_count_patch \
#     \
#     --gps_type image \
#     --gps_render_type time_speed_count \
#     --count_render_type log


#在gps中嵌入时间、速度、数量（log渲染）信息的数据集,3*3高斯核渲染
python train.py \
    --model unet \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/ones_gaussian_patch \
    \
    --gps_type image \
    --gps_render_type ones_speed_count \
    --count_render_type log \
    --epochs 100


# #在gps中嵌入时间(乘以高斯核）、速度、数量（log渲染）信息的数据集
# python train.py \
#     --model unet \
#     --sat_dir datasets/dataset_time/train_val/image \
#     --mask_dir datasets/dataset_time/train_val/mask \
#     --test_sat_dir datasets/dataset_time/test/image_test \
#     --test_mask_dir datasets/dataset_time/test/mask \
#     --gps_dir datasets/dataset_time/GPS/gaussian_patch \
#     \
#     --gps_type image \
#     --gps_render_type gaussian_speed_count \
#     --count_render_type log


# #训练我们的数据集
# python train.py \
#     --model dlink34 \
#     --sat_dir datasets/dataset_mask7/train_val/image \
#     --mask_dir datasets/dataset_mask7/train_val/mask \
#     --test_sat_dir datasets/dataset_mask7/test/image_test \
#     --test_mask_dir datasets/dataset_mask7/test/mask \
#     --gps_dir datasets/dataset_mask7/GPS/taxi \
#     --gps_type data


# #训练渲染时间信息的数据集
# python train.py \
#     --model unet \
#     --sat_dir datasets/dataset_mask7/train_val/image \
#     --mask_dir datasets/dataset_mask7/train_val/mask \
#     --test_sat_dir datasets/dataset_mask7/test/image_test \
#     --test_mask_dir datasets/dataset_mask7/test/mask \
#     --gps_dir datasets/dataset_mask7/GPS/taxi_time_count_patch \
#     --gps_type image