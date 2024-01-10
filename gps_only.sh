# 训练sun的数据集


#GPSdata,plain
ts -G 1 python train.py \
    --model deeplabv3+ \
    --sat_dir '' \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/patch \
    \
    --gps_type data \
    --gps_render_type count \
    --count_render_type direct \
    --epochs 60

ts -G 1 python train.py \
    --model unet \
    --sat_dir '' \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/patch \
    \
    --gps_type data  \
    --gps_render_type count \
    --count_render_type direct \
    --epochs 60

ts -G 2 python train.py \
    --model resunet \
    --sat_dir '' \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/patch \
    \
    --gps_type data \
    --gps_render_type count \
    --count_render_type direct \
    --epochs 60

ts -G 1 python train.py \
    --model linknet \
    --sat_dir '' \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/patch \
    \
    --gps_type data \
    --gps_render_type count \
    --count_render_type direct \
    --epochs 60

ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir '' \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/patch \
    \
    --gps_type data \
    --gps_render_type count \
    --count_render_type direct \
    --epochs 60

ts -G 1 python train.py \
    --model dlink34_1d \
    --sat_dir '' \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/patch \
    \
    --gps_type data \
    --gps_render_type count \
    --count_render_type direct \
    --epochs 60


#GPSimage,tcrender
ts -G 1 python train.py \
    --model deeplabv3+ \
    --sat_dir '' \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60

ts -G 1 python train.py \
    --model unet \
    --sat_dir '' \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60

ts -G 2 python train.py \
    --model resunet \
    --sat_dir '' \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60

ts -G 1 python train.py \
    --model linknet \
    --sat_dir '' \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60

ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir '' \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60

ts -G 1 python train.py \
    --model dlink34_1d \
    --sat_dir '' \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60