#!/bin/bash

modelarg=$1
output=$2

# split parameters from URI 'ntnx://'
string=${modelarg#ntnx://}
MODEL_NAME=$(echo "$string" | awk -F'/' '{print $1}')
MODEL_REVISION=$(echo "$string" | awk -F'/' '{print $2}')
echo "Model Name: $MODEL_NAME"
echo "Model Revision: $MODEL_REVISION"
echo "Model Output Directry: $output"

## create /mnt/models dir
mkdir -p /mnt/models

## checking to see if HF_TOKEN has been set
if [ -z "$HF_TOKEN" ]; then
  ARGS=""
else
  ARGS=" --hf_token ${HF_TOKEN} "
fi

## checking to see if MODEL_REVISION has been set
if [ -z "$MODEL_REVISION" ]; then
  echo "no revision configured, using default value from model_config.json"
  #python3 llm/generate.py --model_name $MODEL_NAME --output $output
  MODEL_REVISION=$(jq -r --arg model "$MODEL_NAME" '.[$model].repo_version' llm/model_config.json)
  echo "Model Revision: $MODEL_REVISION"
  ARGS+=" --model_name $MODEL_NAME --output $output "
else
  #python3 llm/generate.py --repo_version=$MODEL_REVISION --model_name $MODEL_NAME --output $output
  ARGS+=" --repo_version=$MODEL_REVISION --model_name $MODEL_NAME --output $output "
fi

echo "INFO: Running python3 llm/generate.py $ARGS"
python3 llm/generate.py $ARGS

ln -s /mnt/models/$MODEL_NAME/$MODEL_REVISION/config /mnt/models/config
ln -s /mnt/models/$MODEL_NAME/$MODEL_REVISION/model-store /mnt/models/model-store
