#! /bin/bash

echo "*********************************************************"

${CK_ENV_COMPILER_PYTHON_FILE} -m pip freeze > ck-pip-freeze.txt
ck > ck-version.txt

if [ "x${CK_MLPERF_USER_CONF}" != "x" ] ; then
  cp -f ${CK_MLPERF_USER_CONF} user.conf
fi

cd ${CK_ENV_MLPERF_INFERENCE_VISION}/classification_and_detection

export DATA_DIR=${CK_ENV_DATASET_IMAGENET_VAL}

if [ "${CK_ENV_OCTOMIZER_WHEEL}" != "" ] ; then
  export MODEL_DIR=${CK_ENV_OCTOMIZER_WHEEL}
else
  export MODEL_DIR=${CK_ENV_ONNX_MODEL_ROOT}
fi

echo ""
echo "CK CMD: ./run_local.sh $CK_MLPERF_BACKEND $CK_MLPERF_MODEL $CK_MLPERF_DEVICE --scenario $CK_LOADGEN_SCENARIO $CK_LOADGEN_ASSEMBLED_OPTS"
echo ""

./run_local.sh $CK_MLPERF_BACKEND $CK_MLPERF_MODEL $CK_MLPERF_DEVICE --scenario $CK_LOADGEN_SCENARIO $CK_LOADGEN_ASSEMBLED_OPTS 

echo "*********************************************************"
