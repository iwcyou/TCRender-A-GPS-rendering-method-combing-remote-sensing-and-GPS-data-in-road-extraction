#训练sun的数据集
#使用DlinkNet模型


# #sat+GPSimage,tcrender,无膨胀
# ts -G 1 python train.py \
#     --model dlink34 \
#     --sat_dir datasets/dataset_time/train_val/image \
#     --mask_dir datasets/dataset_time/train_val/mask \
#     --test_sat_dir datasets/dataset_time/test/image_test \
#     --test_mask_dir datasets/dataset_time/test/mask \
#     --gps_dir datasets/dataset_time/GPS/time_count_patch \
#     \
#     --gps_type image \
#     --gps_render_type time_speed_count \
#     --count_render_type log \
#     --epochs 60

#sat+GPSimage,tcrender,3*3高斯核
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/gaussian_patch \
    \
    --gps_type image \
    --gps_render_type gaussian_speed_count \
    --count_render_type log \
    --epochs 60

#sat+GPSimage,tcrender,3*3值为1的核
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/ones_gaussian_patch \
    \
    --gps_type image \
    --gps_render_type ones_speed_count \
    --count_render_type log \
    --epochs 60