#
# MLPerf inference; image classification; preprocessing
#
# Copyright (c) 2019 cTuning foundation.
# Copyright (c) 2021 OctoML, Inc.
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
    ml_model_dict = deps['model']['dict']
    ml_model_name = ml_model_dict['customize']['install_env']['MLPERF_MODEL_NAME']

    new_env['CK_MLPERF_MODEL']=ml_model_name

    # Get path to MLCommons inference (can be changed in some dependencies)
    mlperf_inference=deps['mlperf-inference-src']['dict']['env']['CK_ENV_MLPERF_INFERENCE_VISION']
    new_env['CK_ENV_MLPERF_INFERENCE_VISION']=mlperf_inference

    # Check extra opts
    opts=env.get('CK_LOADGEN_OPTS','')

    # Check accuracy
    accuracy=env.get('CK_LOADGEN_ACCURACY','').lower()=='on'
    if accuracy:
        opts='--accuracy '+opts

    data_format=ml_model_dict['env'].get('ML_MODEL_DATA_LAYOUT','')
    if data_format!='':
        opts='--data-format '+data_format+' '+opts

    # Check output directory
    output=os.getcwd()
    output_dir=output
#    output_dir=os.path.join(output, 'mlperf-output')
#    if not os.path.isdir(output_dir):
#        os.makedirs(output_dir)

    opts+=' --output '+output_dir

    # Check model name from a CK package
    model_path=ml_model_dict['env'].get('ML_MODEL_FILEPATH','')
    if model_path!='':
        opts+=' --model '+model_path

    # Set extra options for LOADGEN
    opts=opts.strip()
    new_env['CK_LOADGEN_ASSEMBLED_OPTS']=opts

    # Find path for shared script with run_local.sh
    r=ck.access({'action': 'find', 'module_uoa': 'script', 
                 'data_uoa': '53bb701c440aaa69',
                 'data_uoa#': 'mlperf-inference-object-detection'})
    if r['return']>0: return r
    p=r['path']

    new_env['CK_PATH_TO_COMMON_SCRIPT']=p

    return {'return':0, 'bat':bat, 'new_env':new_env}

# Do not add anything here!
