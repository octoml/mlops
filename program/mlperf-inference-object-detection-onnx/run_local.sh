echo "*********************************************************"
cd ${CK_ENV_MLPERF_INFERENCE_VISION}/classification_and_detection

export DATA_DIR=${CK_ENV_DATASET_COCO}
export MODEL_DIR=${CK_ENV_ONNX_MODEL_ROOT}

echo ""
echo "./run_local.sh $CK_MLPERF_BACKEND $CK_MLPERF_MODEL $CK_MLPERF_DEVICE"
echo ""

./run_local.sh $CK_MLPERF_BACKEND $CK_MLPERF_MODEL $CK_MLPERF_DEVICE

echo "*********************************************************"
