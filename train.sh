# #dataset_b数据集训练脚本
# python train.py \
# 	--model dlink34_1d \
#     --sat_dir datasets/dataset_b/train_val/image \
#     --sat_dir datasets/dataset_b/train_val/image \
#     --mask_dir datasets/dataset_b/train_val/mask \
#     --test_sat_dir datasets/dataset_b/test/image_test \
#     --test_mask_dir datasets/dataset_b/test/mask \
#     --gps_dir datasets/dataset_b/GPS/taxi


# #dataset_1024数据集训练脚本
# python train.py \
# --model dlink34_1d \
# --sat_dir datasets/dataset_1024/train_val/image \
# --sat_dir datasets/dataset_1024/train_val/image \
# --mask_dir datasets/dataset_1024/train_val/mask \
# --test_sat_dir datasets/dataset_1024/test/image_test \
# --test_mask_dir datasets/dataset_1024/test/mask \
# --gps_dir datasets/dataset_1024/GPS/taxi


#无人行道数据集训练脚本
python train.py \
--model dlink34_1d \
--sat_dir datasets/dataset_nofootpath/train_val/image \
--sat_dir datasets/dataset_nofootpath/train_val/image \
--mask_dir datasets/dataset_nofootpath/train_val/mask \
--test_sat_dir datasets/dataset_nofootpath/test/image_test \
--test_mask_dir datasets/dataset_nofootpath/test/mask \
--gps_dir datasets/dataset_nofootpath/GPS/taxi