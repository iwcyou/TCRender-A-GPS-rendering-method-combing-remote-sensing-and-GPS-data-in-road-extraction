"""
训练sun的数据集
使用DlinkNet模型
消融实验
"""

#tcrender只渲染数据的时间信息
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_patch \
    \
    --gps_type image \
    --gps_render_type time \
    --count_render_type direct \
    --epochs 60


#tcrender只渲染数据的速度信息
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/speed_patch \
    \
    --gps_type image \
    --gps_render_type speed \
    --count_render_type direct \
    --epochs 60


#tcrender只渲染数据的时间和数量信息
ts -G 1 python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_quantity_patch \
    \
    --gps_type image \
    --gps_render_type time_quantity \
    --count_render_type log \
    --epochs 60