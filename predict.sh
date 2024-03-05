# #预测Beijing数据集
# python train.py \
#     --model dlink34 \
#     --sat_dir datasets/dataset_time/train_val/image \
#     --mask_dir datasets/dataset_time/train_val/mask \
#     --test_sat_dir datasets/dataset_time/test/image_test \
#     --test_mask_dir datasets/dataset_time/test/mask \
#     --gps_dir datasets/dataset_time/GPS/time_count_patch \
#     \
#     --gps_type image \
#     --gps_render_type time_speed_count \
#     --count_render_type log \
#     --epochs 60 \
# 	--eval predict \
# 	--weight_load_path ./weights_v3/dlink34_sat_gpsimage_time_speed_count_log__/epoch50_val0.5661_test0.9445_0.7818_0.7701_0.6323_0.7732_0.0124.pth




#预测Shenzhen数据集
python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_mask7/train_val/image \
    --mask_dir datasets/dataset_mask7/train_val/mask \
    --test_sat_dir datasets/dataset_mask7/test/image_test \
    --test_mask_dir datasets/dataset_mask7/test/mask \
    --gps_dir datasets/dataset_mask7/GPS/taxi_time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60 \
	--eval predict \
	--weight_load_path ./weights/dlink34_sat_gpsimage_time_speed_count_log__/epoch35_val0.4359_test0.5954_0.2938_0.2840_0.1766_0.2558_0.0061.pth