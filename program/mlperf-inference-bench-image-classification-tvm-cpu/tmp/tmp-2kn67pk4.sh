#! /bin/bash


export PATH=/home/gfursin/CK/local/venv/mlperf-inference/CK/ck-ml/platform.init/generic-linux-dummy:$PATH


. /home/gfursin/CK/local/venv/mlperf-inference/CK/local/env/287b98a34b39e6ee/env.sh
. /home/gfursin/CK/local/venv/mlperf-inference/CK/local/env/86282cd495148cf4/env.sh
. /home/gfursin/CK/local/venv/mlperf-inference/CK/local/env/18915546864618af/env.sh
. /home/gfursin/CK/local/venv/mlperf-inference/CK/local/env/fd541dc7b0164e66/env.sh
. /home/gfursin/CK/local/venv/mlperf-inference/CK/local/env/5519b6485e8e1e87/env.sh
. /home/gfursin/CK/local/venv/mlperf-inference/CK/local/env/9f4f0297f62baaf2/env.sh
. /home/gfursin/CK/local/venv/mlperf-inference/CK/local/env/4de5b11730ac95ce/env.sh
. /home/gfursin/CK/local/venv/mlperf-inference/CK/local/env/d69fd035805643bd/env.sh
. /home/gfursin/CK/local/venv/mlperf-inference/CK/local/env/66e4187464fb39d8/env.sh

export CK_LOADGEN_ACCURACY=on
export CK_LOADGEN_OPTS=
export CK_LOADGEN_SCENARIO=Offline
export CK_MLPERF_BACKEND=onnxruntime
export CK_MLPERF_DEVICE=cpu
export EXTRA_OPS="--count 10"

export CK_MLPERF_MODEL=resnet50
export CK_LOADGEN_ASSEMBLED_OPTS="--accuracy  --output /home/gfursin/CK/local/venv/mlperf-inference/CK/octoml@mlops/program/mlperf-inference-bench-image-classification-onnx-cpu/tmp"
export CK_PATH_TO_COMMON_SCRIPT=/home/gfursin/CK/local/venv/mlperf-inference/CK/octoml@mlops/script/mlperf-inference-image-classification




echo    executing code ...
 ${CK_PATH_TO_COMMON_SCRIPT}/run_local.sh
