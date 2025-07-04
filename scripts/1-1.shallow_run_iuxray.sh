#!/bin/bash

dataset="iu_xray"
annotation="/kaggle/input/iu-xray/iu_xray/annotation.json"
base_dir="./kaggle/input/iu-xray/iu_xray/images"

version="v1_shallow"
savepath="./save/$dataset/$version"

python -u train.py \
    --dataset ${dataset} \
    --annotation ${annotation} \
    --base_dir ${base_dir} \
    --batch_size 1 \
    --val_batch_size 1 \
    --freeze_vm True \
    --vis_use_lora False \
    --savedmodel_path ${savepath} \
    --max_length 60 \
    --min_new_tokens 40 \
    --max_new_tokens 100 \
    --repetition_penalty 2.0 \
    --length_penalty 2.0 \
    --num_workers 8 \
    --devices 2 \
    --max_epochs 15 \
    --limit_val_batches 1.0 \
    --val_check_interval 1.0 \
    --num_sanity_val_steps 0 \
    2>&1 |tee -a ${savepath}/log.txt