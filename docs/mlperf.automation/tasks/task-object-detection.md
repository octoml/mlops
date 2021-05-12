# MLPerf Inference v1.0: object detection

## Official models

| model | reference app | framework | dataset |
| ---- | ---- | ---- | ---- |
| ssd-mobilenet 300x300 | [vision/classification_and_detection](https://github.com/mlperf/inference/tree/r1.0/vision/classification_and_detection) | tensorflow, pytorch, onnx| coco resized to 300x300 [[**automation**](../datasets/coco2017.md)]| 
| ssd-resnet34 1200x1200 | [vision/classification_and_detection](https://github.com/mlperf/inference/tree/r1.0/vision/classification_and_detection) | tensorflow, pytorch, onnx | coco resized to 1200x1200 [[**automation**](../datasets/coco2017.md)] |

## Common CK setup

```
python3 -m pip install ck
ck pull repo:octoml@venv

ck create venv:mlperf-inference --template=mlperf-inference-1.0

ck activate venv:mlperf-inference
```
