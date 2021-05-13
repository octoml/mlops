#
# MLPerf loadgen preprocessing
#
# Developers:
# - Grigori Fursin, OctoML, 2021
#

import json
import os
import re

def ck_preprocess(i):

    ck=i['ck_kernel']
    rt=i['run_time']
    deps=i['deps']

    env=i['env']
    new_env={} # new environment to be added to the run script
    bat='\n'

    hosd=i['host_os_dict']
    tosd=i['target_os_dict']
    remote=tosd.get('remote','')

    if remote=='yes':
       es=tosd['env_set']
    else:
       es=hosd['env_set'] # set or export

    # Get model name from a CK package in MLPerf loadgen format
    ml_model_name=deps['model']['dict']['customize']['install_env']['MLPERF_MODEL_NAME']
    new_env['CK_MLPERF_MODEL']=ml_model_name

    return {'return':0, 'bat':bat, 'new_env':new_env}

# Do not add anything here!
