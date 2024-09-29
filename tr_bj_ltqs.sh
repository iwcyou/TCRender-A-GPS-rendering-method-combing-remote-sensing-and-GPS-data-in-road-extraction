# Train Shenzhen dataset
# shell命令中只能用#注释

weight_save_dir=(
    "./weights_bj_v1"
    "./weights_bj_v2"
    "./weights_bj_v3"
    "./weights_bj_v4"
    "./weights_bj_v5"
)
models=(
    "unet"
    "resunet"
    "deeplabv3+"
    "linknet"
    "dlink34_1d"
    "dlink34"
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
            --dataset_name bj \
            --sat_dir '' \
            --mask_dir datasets/dataset_bj_time/train_val/mask \
            --test_sat_dir '' \
            --test_mask_dir datasets/dataset_bj_time/test/mask \
            --gps_dir datasets/dataset_bj_time/GPS/taxi_gaussian_ltqs_patch \
            \
            --gps_type image \
            --gps_render_type gaussian_ltqs \
            --count_render_type log
        # ltqs, GPS+Satellite
        ts -G "${n}" python train.py \
            --model "${m}" \
            --weight_save_dir "${w}" \
            --dataset_name bj \
            --sat_dir datasets/dataset_bj_time/train_val/image \
            --mask_dir datasets/dataset_bj_time/train_val/mask \
            --test_sat_dir datasets/dataset_bj_time/test/image_test \
            --test_mask_dir datasets/dataset_bj_time/test/mask \
            --gps_dir datasets/dataset_bj_time/GPS/taxi_gaussian_ltqs_patch \
            \
            --gps_type image \
            --gps_render_type gaussian_ltqs \
            --count_render_type log
    done
done