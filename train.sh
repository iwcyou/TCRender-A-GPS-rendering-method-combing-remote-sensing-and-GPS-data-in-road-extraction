#训练sun的数据集
python train.py \
    --model unet \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/patch


# #训练时间渲染的数据集
# python train.py \
#     --model dlink34 \
#     --sat_dir datasets/dataset_time/train_val/image \
#     --mask_dir datasets/dataset_time/train_val/mask \
#     --test_sat_dir datasets/dataset_time/test/image_test \
#     --test_mask_dir datasets/dataset_time/test/mask \
#     --gps_dir datasets/dataset_time/GPS/gaussian_patch \
#     --gps_type image


# #训练我们的数据集
# python train.py \
#     --model dlink34 \
#     --sat_dir datasets/dataset_mask7/train_val/image \
#     --mask_dir datasets/dataset_mask7/train_val/mask \
#     --test_sat_dir datasets/dataset_mask7/test/image_test \
#     --test_mask_dir datasets/dataset_mask7/test/mask \
#     --gps_dir datasets/dataset_mask7/GPS/taxi \
#     --gps_type data