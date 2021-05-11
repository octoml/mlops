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
    ml_model_name=deps['model']['dict']['customize']['install_env']['ML_MODEL_MODEL_NAME']
    new_env['CK_MLPERF_MODEL']=ml_model_name

    path_to_val=deps['dataset-aux']['dict']['env']['CK_CAFFE_IMAGENET_VAL_TXT']
    if not os.path.isfile(path_to_val):
        return {'return':1, 'error':'val.txt was not found in ImageNet aux'}

    path_to_imagenet=deps['dataset']['dict']['env']['CK_ENV_DATASET_IMAGENET_VAL']
    path_to_imagenet_val=os.path.join(path_to_imagenet, 'val_map.txt')

    if not os.path.isfile(path_to_imagenet_val):
        import shutil
        shutil.copyfile(path_to_val, path_to_imagenet_val)

    # Check extra opts
    opts=env.get('CK_LOADGEN_OPTS','')

    # Check accuracy
    accuracy=env.get('CK_LOADGEN_ACCURACY','').lower()=='on'
    if accuracy:
        opts='--accuracy '+opts

    # Check output directory
    output=os.getcwd()
    if accuracy:
        output_dir=os.path.join(output, 'accuracy')
    else:
        output_dir=os.path.join(output, 'performance')

    if os.path.isdir(output_dir):
        os.makedirs(output_dir)

    opts+=' --output '+output_dir

    # Set extra options for LOADGEN
    opts=opts.strip()
    new_env['CK_LOADGEN_ASSEMBLED_OPTS']=opts

    return {'return':0, 'bat':bat, 'new_env':new_env}

# Do not add anything here!
