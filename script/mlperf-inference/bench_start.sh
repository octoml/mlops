#! /bin/bash

echo "*********************************************************"

${CK_ENV_COMPILER_PYTHON_FILE} -m pip freeze > ck-pip-freeze.txt
ck > ck-version.txt

if [ "x${CK_MLPERF_USER_CONF}" != "x" ] ; then
  cp -f ${CK_MLPERF_USER_CONF} user.conf
else
  # reference app uses command line instead of user.conf
  echo "# empty" > user.conf
fi

if [ "x${CK_MLPERF_AUDIT_CONF}" != "x" ] ; then
  cp -f ${CK_MLPERF_AUDIT_CONF} audit.config
fi

if [ "${CK_ENV_OCTOMIZER_WHEEL}" != "" ] ; then
  export MODEL_DIR=${CK_ENV_OCTOMIZER_WHEEL}
else
  export MODEL_DIR=${ML_MODEL_ROOT}
fi

export DATA_DIR=${CK_ENV_DATASET_ROOT}
