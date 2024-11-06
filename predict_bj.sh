# predict Beijing dataset

weight_save_dir=(
    "./weights_v1_bj"
    # "./weights_v2_bj"
    # "./weights_v3_bj"
)
models=(
    # "unet"
    # "resunet"
    # "deeplabv3+"
    # "linknet"
    # "dlink34_1d"
    "dlink34"
)
for w in "${weight_save_dir[@]}"; do
    for m in "${models[@]}"; do
        # vanilla, GPS+Satellite, direct
        ts -G 1 python train.py \
            --model "${m}" \
            --weight_save_dir "${w}" \
            --dataset_name bj \
            --sat_dir ../datasets/dataset_bj_time/train_val/image \
            --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
            --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            --gps_dir ../datasets/dataset_bj_time/GPS/patch \
            \
            --mask_type png \
            --gps_type data \
            --gps_render_type count \
            --quantity_render_type direct \
            --epochs 100 \
            --wandb_group "predict" \
            --wandb_notes "predict Beijing dataset" \
            --eval predict \
            --weight_load_path /home/fk/python_code/ltqs/weights_bj_baseline/dlink34_sat_gpsdata_png_count_direct_0_dice_bce_loss_1.0__/epoch70_val0.6098_test0.9456_0.7690_0.7787_0.6299_0.7718_0.0000.pth
        # ltqs, GPS+Satellite, gaussian
        ts -G 1 python train.py \
            --model "${m}" \
            --weight_save_dir "${w}" \
            --dataset_name bj \
            --sat_dir ../datasets/dataset_bj_time/train_val/image \
            --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
            --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            --gps_dir ../datasets/dataset_bj_time/GPS/gaussian_patch \
            \
            --mask_type png \
            --gps_type image \
            --gps_render_type gaussian_ltqs \
            --quantity_render_type log \
            --epochs 100 \
            --wandb_group "predict" \
            --wandb_notes "predict Beijing dataset" \
            --eval predict \
            --weight_load_path /home/fk/python_code/ltqs/weights_bj_baseline/dlink34_sat_gpsimage_png_gaussian_ltqs_log_0_dice_bce_loss_1.0__/epoch95_val0.6022_test0.9455_0.7861_0.7686_0.6344_0.7751_0.0000.pth
        # filtered, ltqs, GPS+Satellite, gaussian
        ts -G 1 python train.py \
            --model "${m}" \
            --weight_save_dir "${w}" \
            --dataset_name bj \
            --sat_dir ../datasets/dataset_bj_time/train_val/image \
            --mask_dir ../datasets/dataset_bj_time/train_val/mask \
            --test_sat_dir ../datasets/dataset_bj_time/test/image_test \
            --test_mask_dir ../datasets/dataset_bj_time/test/mask \
            --gps_dir ../datasets/dataset_bj_time/GPS/filtered_time_quantity_speed_gaussian_patch \
            \
            --mask_type png \
            --gps_type image \
            --gps_render_type filtered_gaussian_ltqs \
            --quantity_render_type log \
            --epochs 100 \
            --wandb_group "predict" \
            --wandb_notes "predict Beijing dataset" \
            --eval predict \
            --weight_load_path /home/fk/python_code/ltqs/weights_bj_baseline/dlink34_sat_gpsimage_png_filtered_gaussian_ltqs_log_0_dice_bce_loss_1.0__/epoch43_val0.5972_test0.9403_0.8166_0.7271_0.6221_0.7660_0.0000.pth
    done
done
