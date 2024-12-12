# Train Beijing dataset

weight_save_dir=(
    "./weights_bj_ltqs_dilation"
)
models=(
    "dlink34_1d"
)
random_seed=(
    0
    42
    1234
)
for w in "${weight_save_dir[@]}"; do
    for m in "${models[@]}"; do
        for seed in "${random_seed[@]}"; do
            if [ "${m}" == "resunet" ]; then
                n=2
            else
                n=1
            fi
            # # ltqs, GPS
            # ts -G "${n}" python train.py \
            #     --model "${m}" \
            #     --weight_save_dir "${w}_${seed}" \
            #     --dataset_name bj \
            #     --sat_dir '' \
            #     --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            #     --test_sat_dir '' \
            #     --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            #     --gps_dir ../datasets/dataset_bj_time/GPS/gaussian_patch \
            #     \
            #     --gps_type image \
            #     --gps_render_type gaussian_ltqs \
            #     --quantity_render_type log \
            #     --epochs 60 \
            #     --wandb_group "bj_ltqs" \
            #     --wandb_notes "bj, ltqs, GPS"
            # ltqs, GPS+Satellite, ones gaussian
            ts -G "${n}" python train.py \
                --model "${m}" \
                --random_seed "${seed}" \
                --weight_save_dir "${w}_${seed}" \
                --dataset_name bj \
                --sat_dir ../datasets/dataset_bj_time/train_val/image \
                --mask_dir ../datasets/dataset_bj_time/train_val/mask \
                --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
                --test_mask_dir ../datasets/dataset_bj_time/test/mask \
                --gps_dir ../datasets/dataset_bj_time/GPS/ones_gaussian_patch \
                \
                --mask_type png \
                --gps_type image \
                --gps_render_type ones_gaussian_ltqs \
                --quantity_render_type log \
                --epochs 60 \
                --wandb_group "bj_dilation_exp" \
                --wandb_notes "bj, ltqs, GPS+Satellite, dilation exp"
        done
    done
done
