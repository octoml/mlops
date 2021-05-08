echo "*********************************************************"
cd ${CK_ENV_MLPERF_INFERENCE_VISION}/classification_and_detection

export DATA_DIR=${CK_ENV_DATASET_IMAGENET_VAL}
export MODEL_DIR=${CK_ENV_ONNX_MODEL_ROOT}

./run_local.sh $CK_MLPERF_BACKEND $CK_MLPERF_MODEL $CK_MLPERF_DEVICE
# --count 100 --time 60 --scenario Server --qps 200 --max-latency 0.1

echo "*********************************************************"
