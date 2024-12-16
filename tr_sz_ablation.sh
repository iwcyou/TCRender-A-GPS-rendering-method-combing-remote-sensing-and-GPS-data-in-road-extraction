# Train Shenzhen dataset
# shell命令中只能用#注释

weight_save_dir=(
    "./weights_sz_time_quantity_gaussian_seed"
    # "./weights_bj_sdf_v2"
    # "./weights_bj_sdf_v4"
)
models=(
    "dlink34_1d"
)
delta=(
    # 0
    # 10
    20
    # 40
    # 60
    # 80
)
random_seed=(
    0
    42
    2025
)
for w in "${weight_save_dir[@]}"; do
    for m in "${models[@]}"; do
        for seed in "${random_seed[@]}"; do
            if [ "${m}" == "resunet" ]; then
                n=2
            else
                n=1
            fi
            for delta in "${delta[@]}"; do
                # time+quantity, GPS+Satellite, gaussian
                ts -G "${n}" python train.py \
                    --model "${m}" \
                    --random_seed "${seed}" \
                    --weight_save_dir "${w}_${seed}" \
                    --dataset_name sz \
                    --sat_dir ../datasets/dataset_sz_grid/train_val/image \
                    --mask_dir ../datasets/dataset_sz_grid/train_val/mask \
                    --test_sat_dir ../datasets/dataset_sz_grid/test/image_test \
                    --test_mask_dir ../datasets/dataset_sz_grid/test/mask \
                    --gps_dir ../datasets/dataset_sz_grid/GPS/taxi_time_quantity_gaussian_patch \
                    \
                    --mask_type png \
                    --gps_type image \
                    --gps_render_type time_quantity_gaussian \
                    --quantity_render_type log \
                    --epochs 100 \
                    --wandb_group "sz_ablation_try" \
                    --wandb_notes "try time+quantity, GPS+Satellite, gaussian"
                # ts -G "${n}" python train.py \
                #     --model "${m}" \
                #     --weight_save_dir "${w}" \
                #     --dataset_name sz \
                #     --sat_dir ../datasets/dataset_sz_grid/train_val/image \
                #     --mask_dir ../datasets/dataset_sz_grid/train_val/mask \
                #     --test_sat_dir ../datasets/dataset_sz_grid/test/image_test \
                #     --test_mask_dir ../datasets/dataset_sz_grid/test/mask \
                #     --gps_dir ../datasets/dataset_sz_grid/GPS/taxi \
                #     \
                #     --mask_type png \
                #     --gps_type data \
                #     --gps_render_type count \
                #     --quantity_render_type direct \
                #     --epochs 100 \
                #     --wandb_group "sz_baseline" \
                #     --wandb_notes "set random seed to 0"
                # # ltqs, GPS+Satellite, gaussian
                # ts -G "${n}" python train.py \
                #     --model "${m}" \
                #     --weight_save_dir "${w}" \
                #     --dataset_name sz \
                #     --sat_dir ../datasets/dataset_sz_grid/train_val/image \
                #     --mask_dir ../datasets/dataset_sz_grid/train_val/mask \
                #     --test_sat_dir ../datasets/dataset_sz_grid/test/image_test \
                #     --test_mask_dir ../datasets/dataset_sz_grid/test/mask \
                #     --gps_dir ../datasets/dataset_sz_grid/GPS/taxi_gaussian_ltqs_patch \
                #     \
                #     --mask_type png \
                #     --gps_type image \
                #     --gps_render_type gaussian_ltqs \
                #     --quantity_render_type log \
                #     --epochs 100 \
                #     --wandb_group "sz_baseline" \
                #     --wandb_notes "set random seed to 0"
                # # # filtered, ltqs, GPS+Satellite, gaussian
                # # ts -G "${n}" python train.py \
                # #     --model "${m}" \
                # #     --weight_save_dir "${w}" \
                # #     --dataset_name sz \
                # #     --sat_dir ../datasets/dataset_sz_grid/train_val/image \
                # #     --mask_dir ../datasets/dataset_sz_grid/train_val/mask \
                # #     --test_sat_dir ../datasets/dataset_sz_grid/test/image_test \
                # #     --test_mask_dir ../datasets/dataset_sz_grid/test/mask \
                # #     --gps_dir /home/fk/python_code/datasets/dataset_sz_grid/GPS/taxi_filtered_time_quantity_speed_gaussian_patch \
                # #     \
                # #     --mask_type png \
                # #     --gps_type image \
                # #     --gps_render_type filtered_gaussian_ltqs \
                # #     --quantity_render_type log \
                # #     --epochs 100 \
                # #     --wandb_group "sz_baseline" \
                # #     --wandb_notes "set random seed to 0"
            done
        done
    done
done
