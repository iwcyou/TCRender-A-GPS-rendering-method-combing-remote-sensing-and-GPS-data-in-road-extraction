#训练sun的数据集


#image+GPSdata,plain
ts -G 1 python train.py \
    --model deeplabv3+ \
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

ts -G 1 python train.py \
    --model unet \
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

ts -G 2 python train.py \
    --model resunet \
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

ts -G 1 python train.py \
    --model linknet \
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

ts -G 1 python train.py \
    --model dlink34_1d \
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


#sat+GPSimage,tcrender
#在gps中嵌入时间、速度、数量（log渲染）信息的数据集
ts -G 1 python train.py \
    --model deeplabv3+ \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60

ts -G 1 python train.py \
    --model unet \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60

ts -G 2 python train.py \
    --model resunet \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60

ts -G 1 python train.py \
    --model linknet \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60

ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60

ts -G 1 python train.py \
    --model dlink34_1d \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60