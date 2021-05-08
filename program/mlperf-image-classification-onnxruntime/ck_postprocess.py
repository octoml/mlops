#
# MLPerf loadgen preprocessing
#
# Developers:
# - Grigori Fursin, OctoML, 2021
#

import json
import os
import re
from pprint import pprint

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


    ck.out('MLPerf loadgen post-processing: TBD')

    return {'return':0, 'bat':bat, 'new_env':new_env}

# Do not add anything here!
