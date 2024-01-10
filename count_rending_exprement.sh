# 训练sun的数据集
#dlink34模型


#sat+GPSdata,plain
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/patch \
    \
    --gps_type data \
    --gps_render_type count \
    --count_render_type direct \
    --epochs 60

#sat+GPSdata,plain
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/patch \
    \
    --gps_type data \
    --gps_render_type count \
    --count_render_type linear \
    --epochs 60

#sat+GPSdata,plain
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/patch \
    \
    --gps_type data \
    --gps_render_type count \
    --count_render_type log \
    --epochs 60