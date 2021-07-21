# Automate MLPerf inference benchmark submission using CK

[![compatibility](https://github.com/ctuning/ck-guide-images/blob/master/ck-compatible.svg)](https://github.com/ctuning/ck)
[![automation](https://github.com/ctuning/ck-guide-images/blob/master/ck-artifact-automated-and-reusable.svg)](https://cTuning.org/ae)


## Prepare

* [Common setup](https://github.com/ctuning/ck/blob/master/docs/mlperf-automation/setup/common.md)

## Pull already processed MLPerf inference results

```bash
ck pull repo:ck-mlperf-inference
```



## Install CK package with MLPerf inference results

### New (private) repository for submission

Let's consider that you've created a new (private) Git(Hub) repository 
to save MLPerf results: {{MLPERF_RESULTS_URL}}.

Note that you must have some README.md file in the root directory -
it is used by CK to set up paths.

You can install it via CK to be used with CK automation as follows:


```bash
ck install package --tags=mlperf,inference,results,r1.1 --env.PACKAGE_URL={{MLPERF_RESULTS_URL}}
```

Alternatively, you can set up a local empty repository for MLPerf results as follows:
```bash
ck install package --tags=mlperf,inference,results,dummy
```

You can find its location as follows:
```bash
ck locate env --tags=mlperf,inference,results
```

You can install this package to another place as follows:
```bash
ck install package --tags=mlperf,inference,results,dummy --install_path={{YOUR PATH}}
```

You can use already existing directory to register in the CK as a place 
to store MLPerf inference results as follows (it should also contain README.md
in the root):

```bash
ck detect soft --tags=mlperf,inference,results --full_path={{PATH TO README.md IN YOUR DIR WITH MLPERF inference results}} --force_version=1.1
```


## Configure your submission


### Set MLPerf inference division
```bash
ck set kernel --var.mlperf_inference_version=1.1
```
 or
```bash
export CK_MLPERF_INFERENCE_VERSION=1.1
```

### Set MLPerf inference division
```bash
ck set kernel --var.mlperf_inference_division=closed
```
 or
```bash
export CK_MLPERF_INFERENCE_DIVISION=closed
```

### Set MLPerf submitter
```bash
ck set kernel --var.mlperf_inference_submitter=OctoML
```
 or
```bash
export CK_MLPERF_INFERENCE_SUBMITTER=OctoML
```


### Set the name of the base system
```bash
ck set kernel --var.mlperf_inference_system=my-machine-ubuntu20.04
```
 or
```bash
export CK_MLPERF_INFERENCE_SYSTEM=my-machine-ubuntu20.04
```

### Add CK entry for the base system

List available systems from past MLPerf inference submissions:
```bash
ck ls bench.mlperf.system:* | sort
```

```bash
ck add bench.mlperf.system:my-machine-ubuntu20.04 (--base={name from above list})
```

For example:
```bash
ck add bench.mlperf.system:my-machine-ubuntu20.04 --base=1-node-8S-CPX-TensorFlow-INT8
```

CK will fill in some keys but you still need to update it further.

Note that above command will create a CK entry with this system
in the "local" repo:
```bash
ck find bench.mlperf.system:my-machine-ubuntu20.04
```

if you want to prepare system description in the public "ck-mlperf-inference" repo
or in your own private submission repo, use the following command:

```bash
ck add {target CK repo name}:bench.mlperf.system:my-machine-ubuntu20.04
```

You can add "user.conf" to the above CK entry to be automatically picked up by CK MLPerf workflows.
You need to add the MLPerf version to this filename: "user.{MLPerf version}.conf", 
i.e. "user.1.1.conf".


## Prepare and test CK workflows for MLPerf image classification

* [TVM with ONNX Models](https://github.com/octoml/mlops/tree/main/program/mlperf-inference-bench-image-classification-tvm-onnx-cpu)
* [TVM with PyTorch Models](https://github.com/octoml/mlops/tree/main/program/mlperf-inference-bench-image-classification-tvm-pytorch-cpu)
* [ONNX with ONNX models](https://github.com/octoml/mlops/tree/main/program/mlperf-inference-bench-image-classification-onnx-cpu)


## Run CK-based MLPerf submission system

```bash
ck run bench.mlperf.inference --division=closed --framework=onnx --model=resnet50 --scenario=offline
```






# Maintainers

* [OctoML.ai](https://OctoML.ai)
* [cTuning foundation](https://cTuning.org)

*Contact: grigori@octoml.ai*
