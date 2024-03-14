# Train Shenzhen dataset
# shell命令中只能用#注释

weight_save_dir=(
    "./weights_sz_v1"
    "./weights_sz_v2"
    "./weights_sz_v3"
)
models=(
    "deeplabv3+"
    "unet"
    "resunet"
    "linknet"
    "dlink34"
    "dlink34_1d"
)
for w in "${weight_save_dir[@]}"; do
    for m in "${models[@]}"; do
        if [ "${m}" == "resunet" ]; then
            n=2
        else
            n=1
        fi
        # ltqs, GPS
        ts -G "${n}" python train.py \
            --model "${m}" \
            --weight_save_dir "${w}" \
            --dataset_name sz \
            --sat_dir '' \
            --mask_dir datasets/dataset_sz_grid/train_val/mask \
            --test_sat_dir '' \
            --test_mask_dir datasets/dataset_sz_grid/test/mask \
            --gps_dir datasets/dataset_sz_grid/GPS/taxi_gaussian_ltqs_patch \
            \
            --gps_type image \
            --gps_render_type gaussian_ltqs \
            --count_render_type log
        # ltqs, GPS+Satellite
        ts -G "${n}" python train.py \
            --model "${m}" \
            --weight_save_dir "${w}" \
            --dataset_name sz \
            --sat_dir datasets/dataset_sz_grid/train_val/image \
            --mask_dir datasets/dataset_sz_grid/train_val/mask \
            --test_sat_dir datasets/dataset_sz_grid/test/image_test \
            --test_mask_dir datasets/dataset_sz_grid/test/mask \
            --gps_dir datasets/dataset_sz_grid/GPS/taxi_gaussian_ltqs_patch \
            \
            --gps_type image \
            --gps_render_type gaussian_ltqs \
            --count_render_type log
    done
done
