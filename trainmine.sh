# #训练我们的数据集
# python train.py \
#     --model dlink34 \
#     --sat_dir datasets/dataset_mask7/train_val/image \
#     --mask_dir datasets/dataset_mask7/train_val/mask \
#     --test_sat_dir datasets/dataset_mask7/test/image_test \
#     --test_mask_dir datasets/dataset_mask7/test/mask \
#     --gps_dir datasets/dataset_mask7/GPS/taxi \
#     --gps_type data


# #训练渲染时间信息的数据集
# python train.py \
#     --model unet \
#     --sat_dir datasets/dataset_mask7/train_val/image \
#     --mask_dir datasets/dataset_mask7/train_val/mask \
#     --test_sat_dir datasets/dataset_mask7/test/image_test \
#     --test_mask_dir datasets/dataset_mask7/test/mask \
#     --gps_dir datasets/dataset_mask7/GPS/taxi_time_count_patch \
#     --gps_type image



lora_hparams=(
    "--lora_r=8 --lora_alpha=8"
    "--lora_r=16 --lora_alpha=8"
)
sparse_hparams=(
    "--sparse_k=0.04"
    "--sparse_k=0.16"
)
tasks=(
    "cola"
    "mnli"
    "mrpc"
    "qnli"
    "qqp"
    "rte"
    "sst2"
    "stsb"
    "wnli"
)
sparse_methods=(
    "magnitude"
    "gradient"
    "grasp"
    "synflow"
)
for t in "${tasks[@]}"; do
    echo "Queueing ${t}..."
    for h in "${lora_hparams[@]}"; do
        echo ts -G 1 python cls_train.py \
            --lora_enable ${h} \
            --per_device_train_batch_size=32 \
            --task_name="${t}"
    done
    for h in "${sparse_hparams[@]}"; do
        for s in "${sparse_methods[@]}"; do
            echo ts -G 1 python cls_train.py \
                --sparse_enable --sparse_method="${s}" ${h} \
                --per_device_train_batch_size=32 \
                --task_name="${t}"
        done
    done
done