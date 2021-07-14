#! /bin/bash

cd ${CK_ENV_MLPERF_INFERENCE}/tools/submission

${CK_ENV_COMPILER_PYTHON_FILE} submission-checker.py --input ${CK_ENV_MLPERF_INFERENCE_RESULTS}
