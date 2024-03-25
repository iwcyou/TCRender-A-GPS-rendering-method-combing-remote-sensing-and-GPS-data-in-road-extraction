# calculate 2D EMD


weights_dir=(
    "./weights_sz_v1"
    "./weights_sz_v2"
    "./weights_sz_v3"
)
models=(
    "unet"
    "resunet"
    "deeplabv3+"
    "linknet"
    "dlink34_1d"
    "dlink34"
)
# ltqs
methods=(
    "_gpsimage_only_gaussian_ltqs_log__"
    "_sat_gpsimage_gaussian_ltqs_log__"
)
# vanilla
# methods=(
#     "_gpsdata_only_count_direct__"
#     "_sat_only____"
#     "_sat_gpsdata_count_direct__"
# )
for w in "${weights_dir[@]}"; do
    for m in "${models[@]}"; do
        for method in "${methods[@]}"; do
            ts python cal_2d_emd.py \
                --model "${m}" \
                --weight_dir "${w}" \
                --method "${method}"
        done
    done
done
