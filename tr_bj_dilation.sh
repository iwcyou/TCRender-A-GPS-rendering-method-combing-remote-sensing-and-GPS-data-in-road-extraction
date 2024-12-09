# Train Beijing dataset
# shell命令中只能用#注释

weight_save_dir=(
    "./weights_bj_ltqs_dilation"
)
models=(
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
            --dataset_name bj \
            --sat_dir '' \
            --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            --test_sat_dir '' \
            --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            --gps_dir ../datasets/dataset_bj_time/GPS/gaussian_patch \
            \
            --gps_type image \
            --gps_render_type gaussian_ltqs \
            --quantity_render_type log \
            --epochs 60 \
            --wandb_group "bj_ltqs" \
            --wandb_notes "bj, ltqs, GPS"
        # ltqs, GPS+Satellite
        ts -G "${n}" python train.py \
            --model "${m}" \
            --weight_save_dir "${w}" \
            --dataset_name bj \
            --sat_dir ../datasets/dataset_bj_time/train_val/image \
            --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
            --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            --gps_dir ../datasets/dataset_bj_time/GPS/gaussian_patch \
            \
            --gps_type image \
            --gps_render_type gaussian_ltqs \
            --quantity_render_type log \
            --epochs 60 \
            --wandb_group "bj_ltqs" \
            --wandb_notes "bj, ltqs, GPS+Satellite"
    done
done
