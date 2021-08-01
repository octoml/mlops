# MLPerf inference benchmark workflow

* Automation: [CK](https://github.com/ctuning/ck)
* Task: image classification
* Dataset: ImageNet
* Framework: [TVM](https://github.com/apache/tvm)
* Models: PyTorch format
* OS: Ubuntu 20.04
* Device: CPU

# Preparation

# Preparation

* [Common setup](https://github.com/ctuning/ck/blob/master/docs/mlperf-automation/setup/common.md)
* [Framework installation (PyTorch - to load native models)](https://github.com/ctuning/ck/blob/master/docs/mlperf-automation/setup/framework-pytorch.md)
* [Framework installation (TVM)](https://github.com/ctuning/ck/blob/master/docs/mlperf-automation/setup/framework-tvm.md)
* [Dataset preparation](https://github.com/ctuning/ck/blob/master/docs/mlperf-automation/datasets/imagenet2012.md)

## Models

```bash
ck install package --tags=model,image-classification,mlperf,pytorch
```

For now, we support only [resnet50_INT8bit_quantized.pt](https://github.com/octoml/mlops/blob/main/package/ml-model-mlperf-resnet50-v1.5-pytorch/.cm/meta.json) model.


## Python prerequisites

```bash
ck run program:mlperf-inference-bench-image-classification-tvm-pytorch-cpu \
        --cmd_key=install-python-requirements
```

# Test accuracy

## Offline

Run with default parameters
```bash
ck run program:mlperf-inference-bench-image-classification-tvm-pytorch-cpu \
        --cmd_key=accuracy-offline
```

Customize it:
```bash
ck run program:mlperf-inference-bench-image-classification-tvm-pytorch-cpu \
        --cmd_key=accuracy-offline \
        --env.MLPERF_TVM_EXECUTOR=graph \
        --env.MLPERF_TVM_TARGET="llvm" \
        --env.OMP_NUM_THREADS=4 \
        --env.EXTRA_OPS="--count=100 --threads 4 --max-batchsize 1"

```

## Server

```bash
time ck run program:mlperf-inference-bench-image-classification-tvm-pytorch-cpu \
     --cmd_key=accuracy-server \
     --env.OMP_NUM_THREADS=8 \
     --env.EXTRA_OPS="--threads 8 --max-batchsize 1 --time 100 --qps 500" 
```

## SingleStream

```bash
ck run program:mlperf-inference-bench-image-classification-tvm-pytorch-cpu \
        --cmd_key=accuracy-singlestream
```


# Test performance 


## Offline

Run with default parameters
```bash
ck run program:mlperf-inference-bench-image-classification-tvm-pytorch-cpu \
        --cmd_key=performance-offline
```

## Server

```bash
time ck run program:mlperf-inference-bench-image-classification-tvm-pytorch-cpu \
     --cmd_key=performance-server \
     --env.OMP_NUM_THREADS=8 \
     --env.EXTRA_OPS="--threads 8 --max-batchsize 1 --time 100 --qps 500" 
```

## SingleStream

```bash
ck run program:mlperf-inference-bench-image-classification-tvm-pytorch-cpu \
        --cmd_key=performance-singlestream
```
