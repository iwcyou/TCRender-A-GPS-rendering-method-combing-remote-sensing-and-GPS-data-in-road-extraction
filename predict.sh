#预测Shenzhen数据集


#dlink34、gps、sat、ltqs预测图像,高斯渲染
python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_sz_grid/train_val/image \
    --mask_dir datasets/dataset_sz_grid/train_val/mask \
    --test_sat_dir datasets/dataset_sz_grid/test/image_test \
    --test_mask_dir datasets/dataset_sz_grid/test/mask \
    --gps_dir datasets/dataset_sz_grid/GPS/taxi_gaussian_ltqs_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
	--eval predict \
	--weight_load_path ./weights_sz_v1/dlink34_sat_gpsimage_gaussian_ltqs_log__/epoch53_val0.6260_test0.9428_0.6776_0.7511_0.5538_0.7096_0.0116.pth


# #dlink34、sat、gps、plain预测图像
# python train.py \
#     --model dlink34 \
#     --sat_dir datasets/dataset_sz_grid/train_val/image \
#     --mask_dir datasets/dataset_sz_grid/train_val/mask \
#     --test_sat_dir datasets/dataset_sz_grid/test/image_test \
#     --test_mask_dir datasets/dataset_sz_grid/test/mask \
#     --gps_dir datasets/dataset_sz_grid/GPS/taxi \
#     \
#     --gps_type data \
#     --gps_render_type count \
#     --count_render_type direct \
# 	--eval predict \
# 	--weight_load_path ./weights_sz_grid/dlink34_sat_gpsdata_count_direct__/epoch59_val0.5688_test0.7380_0.4702_0.5421_0.3805_0.4924_0.0056.pth



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
# 	  --eval predict \
#     --weight_load_path ./weights_sz_grid/dlink34_sat_only____/epoch56_val0.5029_test0.7486_0.4433_0.5017_0.3373_0.4572_0.0066.pth


# #dlink34、gps、plain预测图像
# python train.py \
#     --model dlink34 \
#     --sat_dir '' \
#     --mask_dir datasets/dataset_sz_grid/train_val/mask \
#     --test_sat_dir '' \
#     --test_mask_dir datasets/dataset_sz_grid/test/mask \
#     --gps_dir datasets/dataset_sz_grid/GPS/taxi \
#     \
#     --gps_type data \
#     --gps_render_type count \
#     --count_render_type direct \
# 	  --eval predict \
# 	  --weight_load_path ./weights_sz_grid/dlink34_gpsdata_only_count_direct__/epoch51_val0.4491_test0.7132_0.3852_0.4205_0.2640_0.3739_0.0094.pth
