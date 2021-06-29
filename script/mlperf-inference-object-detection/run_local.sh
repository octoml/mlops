#! /bin/bash

echo "*********************************************************"

cd ${CK_ENV_MLPERF_INFERENCE_VISION}/classification_and_detection

export DATA_DIR=${CK_ENV_DATASET_COCO}

if [ "${CK_ENV_OCTOMIZER_WHEEL}" != "" ] ; then
  export MODEL_DIR=${CK_ENV_OCTOMIZER_WHEEL}
else
  export MODEL_DIR=${CK_ENV_ONNX_MODEL_ROOT}
fi

if [ "x${CK_ENV_COMPILER_PYTHON_FILE}" != "x" ] ; then
  # fix that problem with run_local that uses "python" instead of python3
  alias python=${CK_ENV_COMPILER_PYTHON_FILE}
fi

echo ""
echo "CK CMD: ./run_local.sh $CK_MLPERF_BACKEND $CK_MLPERF_MODEL $CK_MLPERF_DEVICE --scenario $CK_LOADGEN_SCENARIO $CK_LOADGEN_ASSEMBLED_OPTS"
echo ""

./run_local.sh $CK_MLPERF_BACKEND $CK_MLPERF_MODEL $CK_MLPERF_DEVICE --scenario $CK_LOADGEN_SCENARIO $CK_LOADGEN_ASSEMBLED_OPTS 

echo "*********************************************************"
