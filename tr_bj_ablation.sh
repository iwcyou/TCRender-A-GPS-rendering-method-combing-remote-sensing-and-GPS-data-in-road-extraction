# Train Beijing dataset
# shell命令中只能用#注释

weight_save_dir=(
    "./weights_bj_ablation_seed0"
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
for w in "${weight_save_dir[@]}"; do
    for m in "${models[@]}"; do
        if [ "${m}" == "resunet" ]; then
            n=2
        else
            n=1
        fi
        for delta in "${delta[@]}"; do
            # # only embedding temporal information
            # ts -G "${n}" python train.py \
            #     --model "${m}" \
            #     --weight_save_dir "${w}" \
            #     --dataset_name bj \
            #     --sat_dir ../datasets/dataset_bj_time/train_val/image \
            #     --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            #     --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
            #     --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            #     --gps_dir ../datasets/dataset_bj_time/GPS/time_patch \
            #     \
            #     --mask_type png \
            #     --gps_type image \
            #     --gps_render_type time \
            #     --quantity_render_type direct \
            #     --epochs 100 \
            #     --wandb_group "bj_ablation" \
            #     --wandb_notes "only embedding temporal information"
            # # only embedding rate-of-occurrence information
            # ts -G "${n}" python train.py \
            #     --model "${m}" \
            #     --weight_save_dir "${w}" \
            #     --dataset_name bj \
            #     --sat_dir ../datasets/dataset_bj_time/train_val/image \
            #     --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            #     --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
            #     --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            #     --gps_dir ../datasets/dataset_bj_time/GPS/patch \
            #     \
            #     --mask_type png \
            #     --gps_type data \
            #     --gps_render_type quantity \
            #     --quantity_render_type log \
            #     --epochs 100 \
            #     --wandb_group "bj_ablation" \
            #     --wandb_notes "only embedding rate-of-occurrence information"
            # # # only embedding speed information
            # ts -G "${n}" python train.py \
            #     --model "${m}" \
            #     --weight_save_dir "${w}" \
            #     --dataset_name bj \
            #     --sat_dir ../datasets/dataset_bj_time/train_val/image \
            #     --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            #     --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
            #     --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            #     --gps_dir ../datasets/dataset_bj_time/GPS/speed_patch \
            #     \
            #     --mask_type png \
            #     --gps_type image \
            #     --gps_render_type speed \
            #     --quantity_render_type direct \
            #     --epochs 100 \
            #     --wandb_group "bj_ablation" \
            #     --wandb_notes "only embedding speed information"
            # #embedding time and quantity information
            # ts -G "${n}" python train.py \
            #     --model "${m}" \
            #     --weight_save_dir "${w}" \
            #     --dataset_name bj \
            #     --sat_dir ../datasets/dataset_bj_time/train_val/image \
            #     --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            #     --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
            #     --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            #     --gps_dir ../datasets/dataset_bj_time/GPS/time_quantity_patch \
            #     \
            #     --mask_type png \
            #     --gps_type image \
            #     --gps_render_type time_quantity \
            #     --quantity_render_type log \
            #     --epochs 100 \
            #     --wandb_group "bj_ablation" \
            #     --wandb_notes "only embedding time and quantity information"
            # embedding time, quantity and speed information
            ts -G "${n}" python train.py \
                --model "${m}" \
                --weight_save_dir "${w}" \
                --dataset_name bj \
                --sat_dir ../datasets/dataset_bj_time/train_val/image \
                --mask_dir ../datasets/dataset_bj_time/train_val/mask \
                --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
                --test_mask_dir ../datasets/dataset_bj_time/test/mask \
                --gps_dir ../datasets/dataset_bj_time/GPS/time_quantity_speed_patch \
                \
                --mask_type png \
                --gps_type image \
                --gps_render_type time_quantity_speed \
                --quantity_render_type log \
                --epochs 100 \
                --wandb_group "bj_ablation" \
                --wandb_notes "embedding time, quantity and speed information"
            # # ltqs, GPS
            # ts -G "${n}" python train.py \
            #     --model "${m}" \
            #     --weight_save_dir "${w}" \
            #     --dataset_name sz \
            #     --sat_dir '' \
            #     --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            #     --test_sat_dir '' \
            #     --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            #     --gps_dir ../datasets/dataset_bj_time/GPS/taxi_gaussian_ltqs_patch \
            #     \
            #     --gps_type image \
            #     --gps_render_type gaussian_ltqs \
            #     --count_render_type log
            # # vanilla, GPS+Satellite, direct
            # ts -G "${n}" python train.py \
            #     --model "${m}" \
            #     --weight_save_dir "${w}" \
            #     --dataset_name bj \
            #     --sat_dir ../datasets/dataset_bj_time/train_val/image \
            #     --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            #     --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
            #     --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            #     --gps_dir ../datasets/dataset_bj_time/GPS/patch \
            #     \
            #     --mask_type png \
            #     --gps_type data \
            #     --gps_render_type count \
            #     --quantity_render_type direct \
            #     --epochs 100 \
            #     --wandb_group "bj_baseline" \
            #     --wandb_notes "set random seed to 0"
            # # ltqs, GPS+Satellite, gaussian
            # ts -G "${n}" python train.py \
            #     --model "${m}" \
            #     --weight_save_dir "${w}" \
            #     --dataset_name bj \
            #     --sat_dir ../datasets/dataset_bj_time/train_val/image \
            #     --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            #     --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
            #     --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            #     --gps_dir ../datasets/dataset_bj_time/GPS/gaussian_patch \
            #     \
            #     --mask_type png \
            #     --gps_type image \
            #     --gps_render_type gaussian_ltqs \
            #     --quantity_render_type log \
            #     --epochs 100 \
            #     --wandb_group "bj_baseline" \
            #     --wandb_notes "set random seed to 0"
            # # filtered, ltqs, GPS+Satellite, gaussian
            # ts -G "${n}" python train.py \
            #     --model "${m}" \
            #     --weight_save_dir "${w}" \
            #     --dataset_name bj \
            #     --sat_dir ../datasets/dataset_bj_time/train_val/image \
            #     --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            #     --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
            #     --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            #     --gps_dir ../datasets/dataset_bj_time/GPS/filtered_time_quantity_speed_gaussian_patch \
            #     \
            #     --mask_type png \
            #     --gps_type image \
            #     --gps_render_type filtered_gaussian_ltqs \
            #     --quantity_render_type log \
            #     --epochs 100 \
            #     --wandb_group "bj_baseline" \
            #     --wandb_notes "set random seed to 0"
            # # filtered, ltqs, GPS+Satellite, gaussian
            # ts -G "${n}" python train.py \
            #     --model "${m}" \
            #     --weight_save_dir "${w}" \
            #     --dataset_name bj \
            #     --sat_dir ../datasets/dataset_bj_time/train_val/image \
            #     --mask_dir ../datasets/dataset_bj_time/train_val/mask_sdf_T \
            #     --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
            #     --test_mask_dir ../datasets/dataset_bj_time/test/mask_sdf_T \
            #     --gps_dir ../datasets/dataset_bj_time/GPS/filtered_time_quantity_speed_gaussian_patch \
            #     \
            #     --mask_type sdf \
            #     --gps_type image \
            #     --gps_render_type filtered_gaussian_ltqs \
            #     --quantity_render_type log \
            #     --epochs 60 \
            #     --delta "${delta}"
        done
    done
done
