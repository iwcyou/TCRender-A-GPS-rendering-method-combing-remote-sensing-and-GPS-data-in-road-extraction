# train bj dataset
# use DlinkNet model
# ablation experiment


weight_save_dir=(
    "./weights_sz_v1"
    "./weights_sz_v2"
    # "./weights_sz_v3"
)
models=(
    "dlink34"
)
for w in "${weight_save_dir[@]}"; do
    for m in "${models[@]}"; do
        if [ "${m}" == "resunet" ]; then
            n=2
        else
            n=1
        fi
        # only embedding temporal information
        ts -G "${n}" python train.py \
            --model "${m}" \
            --weight_save_dir "${w}" \
            --dataset_name bj \
            --sat_dir datasets/dataset_bj_time/train_val/image \
            --mask_dir datasets/dataset_bj_time/train_val/mask \
            --test_sat_dir datasets/dataset_bj_time/test/image_test \
            --test_mask_dir datasets/dataset_bj_time/test/mask \
            --gps_dir datasets/dataset_bj_time/GPS/time_patch \
            \
            --gps_type image \
            --gps_render_type time \
            --count_render_type direct \
            --epochs 60
        # only embedding rate-of-occurrence information
        ts -G "${n}" python train.py \
            --model "${m}" \
            --weight_save_dir "${w}" \
            --dataset_name bj \
            --sat_dir datasets/dataset_bj_time/train_val/image \
            --mask_dir datasets/dataset_bj_time/train_val/mask \
            --test_sat_dir datasets/dataset_bj_time/test/image_test \
            --test_mask_dir datasets/dataset_bj_time/test/mask \
            --gps_dir datasets/dataset_bj_time/GPS/gaussian_patch \
            \
            --gps_type image \
            --gps_render_type quantity \
            --count_render_type direct \
            --epochs 60
        # only embedding speed information
        ts -G "${n}" python train.py \
            --model "${m}" \
            --weight_save_dir "${w}" \
            --dataset_name bj \
            --sat_dir datasets/dataset_bj_time/train_val/image \
            --mask_dir datasets/dataset_bj_time/train_val/mask \
            --test_sat_dir datasets/dataset_bj_time/test/image_test \
            --test_mask_dir datasets/dataset_bj_time/test/mask \
            --gps_dir datasets/dataset_bj_time/GPS/speed_patch \
            \
            --gps_type image \
            --gps_render_type speed \
            --count_render_type direct \
            --epochs 60
        # only embedding time and quantity information
        ts -G "${n}" python train.py \
            --model "${m}" \
            --weight_save_dir "${w}" \
            --dataset_name bj \
            --sat_dir datasets/dataset_bj_time/train_val/image \
            --mask_dir datasets/dataset_bj_time/train_val/mask \
            --test_sat_dir datasets/dataset_bj_time/test/image_test \
            --test_mask_dir datasets/dataset_bj_time/test/mask \
            --gps_dir datasets/dataset_bj_time/GPS/time_quantity_patch \
            \
            --gps_type image \
            --gps_render_type time_quantity \
            --count_render_type log \
            --epochs 60
    done
done
