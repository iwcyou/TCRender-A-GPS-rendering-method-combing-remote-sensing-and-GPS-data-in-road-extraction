# 训练shenzhen数据集
#dlink34模型


#gps_only,plain
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir '' \
    --mask_dir datasets/dataset_mask7/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_mask7/test/mask \
    --gps_dir datasets/dataset_mask7/GPS/taxi \
    \
    --gps_type data \
    --gps_render_type count \
    --count_render_type direct \
    --epochs 60

#sat_only
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_mask7/train_val/image \
    --mask_dir datasets/dataset_mask7/train_val/mask \
    --test_sat_dir datasets/dataset_mask7/test/image_test \
    --test_mask_dir datasets/dataset_mask7/test/mask \
    --gps_dir '' \
    \
    --gps_type '' \
    --gps_render_type '' \
    --count_render_type '' \
    --epochs 60

#sat+GPSdata
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_mask7/train_val/image \
    --mask_dir datasets/dataset_mask7/train_val/mask \
    --test_sat_dir datasets/dataset_mask7/test/image_test \
    --test_mask_dir datasets/dataset_mask7/test/mask \
    --gps_dir datasets/dataset_mask7/GPS/taxi \
    \
    --gps_type data \
    --gps_render_type count \
    --count_render_type direct \
    --epochs 60



#gps_only,TCRender
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir '' \
    --mask_dir datasets/dataset_mask7/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_mask7/test/mask \
    --gps_dir datasets/dataset_mask7/GPS/taxi_time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60

#sat+GPSdata
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_mask7/train_val/image \
    --mask_dir datasets/dataset_mask7/train_val/mask \
    --test_sat_dir datasets/dataset_mask7/test/image_test \
    --test_mask_dir datasets/dataset_mask7/test/mask \
    --gps_dir datasets/dataset_mask7/GPS/taxi_time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60