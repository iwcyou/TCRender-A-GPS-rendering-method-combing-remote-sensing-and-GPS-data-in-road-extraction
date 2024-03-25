#测试用的脚本

ts -G 1 python train.py \
    --model unet \
    --weight_save_dir ./weights_sz_v3_add \
    --dataset_name sz \
    --sat_dir datasets/dataset_sz_grid/train_val/image \
    --mask_dir datasets/dataset_sz_grid/train_val/mask \
    --test_sat_dir datasets/dataset_sz_grid/test/image_test \
    --test_mask_dir datasets/dataset_sz_grid/test/mask \
    --gps_dir datasets/dataset_sz_grid/GPS/taxi \
    \
    --gps_type data \
    --gps_render_type count \
    --count_render_type direct
