#!/bin/bash

# 获取当前日期
DATE=$(date +"%Y-%m-%d")

# 创建日志目录
mkdir -p logs/$DATE

# 激活虚拟环境
source activate rome

# 设置环境变量
export HUGGINGFACE_CACHE=/share/huggingface/
export PYTHONUNBUFFERED=1
export CUDA_VISIBLE_DEVICES=1

python3 -m experiments.evaluate \
    --alg_name=ROME \
    --model_name=/share/huggingface/gpt-j-6b \
    --hparams_fname=gpt-j-6b.json \
    >logs/$DATE/log_2.log 2>&1 &
