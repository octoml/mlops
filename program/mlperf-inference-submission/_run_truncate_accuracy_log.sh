#! /bin/bash

${CK_ENV_COMPILER_PYTHON_FILE} ${CK_ENV_MLPERF_INFERENCE}/tools/submission/truncate_accuracy_log.py --input ${CK_ENV_MLPERF_INFERENCE_RESULTS} --submitter ${CK_MLPERF_SUBMITTER} --backup ${CK_ENV_MLPERF_INFERENCE_RESULTS}/../backup
