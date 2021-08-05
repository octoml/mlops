# Resnet 50 FP32 opset-8 model

Latest PyTorch and ONNX cause seg fault in MLPerf inference (main.py)

Working config:
 PyTorch 1.5.0
 ONNX 1.8.1
 RESNET50 model opset-8


# Doens't work with ONNX > 1.8.1
ck install package --tags=lib,python-package,onnxruntime-cpu,1.8.1 
ck install package --tags=lib,python-package,onnx,1.8.1

# Current MLPerf reference implementation doesn't work with pytorch > 1.5.0
ck install package --tags=lib,python-package,pytorch,1.5.0
ck install package --tags=lib,python-package,torchvision,0.6.0

ck install package --tags=model,image-classification,mlperf,pytorch,resnet50,v1.5-int8-quantized




## Offline scenario

### Accuracy

```bash
time ck run program:mlperf-inference-bench-image-classification-pytorch-cpu \
     --clean \
     --cmd_key=accuracy-offline \
     --env.EXTRA_OPS="--count 100 --time 10"
```
     --env.OMP_NUM_THREADS=1 \


### Performance

```bash
time ck run program:mlperf-inference-bench-image-classification-pytorch-onnx-cpu \
     --cmd_key=performance-offline \
     --env.EXTRA_OPS="--threads 120 --count 100 --time 10"
```
     --env.OMP_NUM_THREADS=1 \

## Server scenario

