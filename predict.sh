#预测Shenzhen数据集


#dlink34、gps、sat、tcrender预测图像
python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_sz_grid/train_val/image \
    --mask_dir datasets/dataset_sz_grid/train_val/mask \
    --test_sat_dir datasets/dataset_sz_grid/test/image_test \
    --test_mask_dir datasets/dataset_sz_grid/test/mask \
    --gps_dir datasets/dataset_sz_grid/GPS/taxi_time_quantity_speed_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
	--eval predict \
	--weight_load_path ./weights/dlink34_sat_gpsimage_time_speed_count_log__/epoch50_val0.5631_test0.7308_0.4904_0.5526_0.3948_0.5067_0.0056.pth

# #dlink34、sat、gps、plain预测图像
# python train.py \
#     --model dlink34 \
#     --sat_dir datasets/dataset_sz_grid/train_val/image \
#     --mask_dir datasets/dataset_sz_grid/train_val/mask \
#     --test_sat_dir datasets/dataset_sz_grid/test/image_test \
#     --test_mask_dir datasets/dataset_sz_grid/test/mask \
#     --gps_dir datasets/dataset_sz_grid/GPS/patch \
#     \
#     --gps_type data \
#     --gps_render_type count \
#     --count_render_type direct \
# 	--eval predict \
# 	--weight_load_path ./weights_v3/dlink34_sat_gpsdata_count_direct__/epoch34_val0.5634_test0.9449_0.7880_0.7666_0.6353_0.7757_0.0094.pth

# #dlink34、sat、plain预测图像
# python train.py \
#     --model dlink34 \
#     --sat_dir datasets/dataset_sz_grid/train_val/image \
#     --mask_dir datasets/dataset_sz_grid/train_val/mask \
#     --test_sat_dir datasets/dataset_sz_grid/test/image_test \
#     --test_mask_dir datasets/dataset_sz_grid/test/mask \
#     --gps_dir '' \
#     \
#     --gps_type '' \
#     --gps_render_type '' \
#     --count_render_type '' \
# 	--eval predict \
# 	--weight_load_path ./weights_v3/dlink34_sat_only____/epoch25_val0.5407_test0.9403_0.7756_0.7460_0.6120_0.7579_0.0138.pth

# #dlink34、gps、plain预测图像
# python train.py \
#     --model dlink34 \
#     --sat_dir '' \
#     --mask_dir datasets/dataset_sz_grid/train_val/mask \
#     --test_sat_dir '' \
#     --test_mask_dir datasets/dataset_sz_grid/test/mask \
#     --gps_dir datasets/dataset_sz_grid/GPS/patch \
#     \
#     --gps_type data \
#     --gps_render_type count \
#     --count_render_type direct \
# 	--eval predict \
# 	--weight_load_path ./weights_v3/dlink34_gpsdata_only_count_direct__/epoch39_val0.4679_test0.9316_0.7015_0.7165_0.5504_0.7071_0.0104.pth
