#! /bin/bash

# Normally the path will be to script:mlperf-inference-object-detection

echo "Changing path to common scripts: ${CK_PATH_TO_COMMON_SCRIPT}"
cd ${CK_PATH_TO_COMMON_SCRIPT}

./run_local.sh $@
