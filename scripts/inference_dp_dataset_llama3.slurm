#!/bin/bash
#PBS -q normal
#PBS -j oe
#PBS -l select=1:ngpus=1
#PBS -l walltime=01:00:00
#PBS -N sampler
module load miniforge3
conda activate neo

BASE_PATH="/home/users/ntu/mohor001/neoori"

cd $BASE_PATH
export PYTHONPATH=${BASE_PATH}
python steps/inference_dp.py \
          --dataset-path datasets/CodeForce/NeoCoder/NeoCoder.json \
          --model-name meta-llama/Llama-3.1-8B-Instruct \
          --dp-rounds 5 \
          --batch-size 1 \
          --output-dir datasets/CodeForce/inference \
          --overwrite
