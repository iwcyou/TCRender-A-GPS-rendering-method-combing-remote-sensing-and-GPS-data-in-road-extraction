#测试用的脚本

echo ts -G 2 python train.py \
        --model resunet \
        --sat_dir '' \
        --mask_dir datasets/dataset_sz_grid/train_val/mask \
        --test_sat_dir '' \
        --test_mask_dir datasets/dataset_sz_grid/test/mask \
        --gps_dir datasets/dataset_sz_grid/GPS/taxi \
        \
        --gps_type data \
        --gps_render_type count \
        --count_render_type direct \
        --epochs 60
