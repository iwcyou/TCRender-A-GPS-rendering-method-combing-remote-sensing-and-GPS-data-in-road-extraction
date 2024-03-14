#测试用的脚本

# ltqs, GPS
ts -G 2 python train.py \
    --dataset_name sz \
    --model resunet \
    --weight_save_dir ./weights_sz_v3 \
    --sat_dir '' \
    --mask_dir datasets/dataset_sz_grid/train_val/mask \
    --test_sat_dir '' \
    --test_mask_dir datasets/dataset_sz_grid/test/mask \
    --gps_dir datasets/dataset_sz_grid/GPS/taxi_gaussian_ltqs_patch \
    \
    --gps_type image \
    --gps_render_type gaussian_ltqs \
    --count_render_type log
