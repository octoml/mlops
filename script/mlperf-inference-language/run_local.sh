#! /bin/bash

echo "*********************************************************"

cd $CK_ENV_MLPERF_INFERENCE/language/bert

export BUILD_DIR=build
export DATA_DIR=$BUILD_DIR/data
export BERT_DIR=$DATA_DIR/bert_tf_v1_1_large_fp32_384_v2
export RESULT_DIR=$BUILD_DIR/result
export LOG_DIR=$BUILD_DIR/logs

export MODEL_DIR=$CK_ENV_ONNX_MODEL_ROOT

mkdir -p $BUILD_DIR
mkdir -p $DATA_DIR
mkdir -p $RESULT_DIR

ln -sf $CK_ENV_DATASET_SQUAD_DEV/dev-v1.1.json $DATA_DIR/dev-v1.1.json
ln -sf $MODEL_DIR $BERT_DIR
ln -sf $CK_MLPERF_OUTPUT_DIR $BUILD_DIR/logs

echo ""
echo "CK CMD: $CK_ENV_COMPILER_PYTHON_FILE run.py --backend=$CK_MLPERF_BACKEND --mlperf_conf=$CK_ENV_MLPERF_INFERENCE_MLPERF_CONF --scenario=$CK_LOADGEN_SCENARIO $CK_LOADGEN_ASSEMBLED_OPTS"
echo ""

# TODO: user.conf, --quantized & quantized model, --profile

$CK_ENV_COMPILER_PYTHON_FILE run.py --backend=$CK_MLPERF_BACKEND --scenario=$CK_LOADGEN_SCENARIO --mlperf_conf=$CK_ENV_MLPERF_INFERENCE_MLPERF_CONF $CK_LOADGEN_ASSEMBLED_OPTS

echo "*********************************************************"
