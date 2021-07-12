#
# MLPerf inference; language; preprocessing
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

    # # Get model name from a CK package in MLPerf loadgen format
    # ml_model_dict = deps['model']['dict']
    # ml_model_name = ml_model_dict['customize']['install_env']['MLPERF_MODEL_NAME']

    # new_env['CK_MLPERF_MODEL']=ml_model_name

    # path_to_squad=deps['dataset']['dict']['env']['CK_ENV_DATASET_SQUAD_DEV']
    # path_to_squad_dev=os.path.join(path_to_squad, 'dev-v1.1.json')

    # Check extra opts
    opts=env.get('CK_LOADGEN_OPTS','')

    # Check accuracy
    accuracy=env.get('CK_LOADGEN_ACCURACY','').lower()=='on'
    if accuracy:
        opts='--accuracy '+opts

    # Check max examples
    max_examples=env.get('CK_LOADGEN_MAX_EXAMPLES','')
    if max_examples:
        opts+='--max_examples='+max_examples

    # Check output directory
    output=os.getcwd()
    output_dir=output
    new_env['CK_MLPERF_OUTPUT_DIR']=output_dir

    # Set extra options for LOADGEN
    opts=opts.strip()
    new_env['CK_LOADGEN_ASSEMBLED_OPTS']=opts

    # Find path for shared script with run_local.sh
    r=ck.access({'action': 'find', 
                 'module_uoa': 'script', 
                 'data_uoa': '80cd847d1831aed2',
                 'data_uoa#': 'mlperf-inference-language'})
    if r['return']>0: return r
    p=r['path']
    if r['return']>0: return r
    p=r['path']

    new_env['CK_PATH_TO_COMMON_SCRIPT']=p

    return {'return':0, 'bat':bat, 'new_env':new_env}

# Do not add anything here!
