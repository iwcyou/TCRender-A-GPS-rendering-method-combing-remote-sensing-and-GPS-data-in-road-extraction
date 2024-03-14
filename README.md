# LTQS:Improving Road Extraction from Satellite Images with Rich GPS Feature Augmentations

The source code of eccv 2024 paper *"LTQS:Improving Road Extraction from Satellite Images with Rich GPS Feature Augmentations"*

## Usage

```bash
python train.py \
    --model dlink34 \
    --sat_dir datasets/dataset_time/train_val/image \
    --mask_dir datasets/dataset_time/train_val/mask \
    --test_sat_dir datasets/dataset_time/test/image_test \
    --test_mask_dir datasets/dataset_time/test/mask \
    --gps_dir datasets/dataset_time/GPS/time_count_patch \
    \
    --gps_type image \
    --gps_render_type time_speed_count \
    --count_render_type log \
    --epochs 60
```

## Beijing dataset

Beijing dataset need the permission by  [Tao Sun](https://github.com/suniique/Leveraging-Crowdsourced-GPS-Data-for-Road-Extraction-from-Aerial-Imagery), you can contact via: suntao@tongji.edu.cn.

## Shenzhen dataset

In our dataset, you can get the satellite images of every city by [Amap API ](https://github.com/myBestLove/googleMapDownloader), and get the road network(mask) by our crawler *"road_tile_downloader.html"* .

And our GPS is available upon request.

### Dataset discription

