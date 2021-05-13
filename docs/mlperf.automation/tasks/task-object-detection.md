# MLPerf Inference v1.0: object detection

## Official models

| model | reference app | framework | dataset |
| ---- | ---- | ---- | ---- |
| ssd-mobilenet 300x300 | [vision/classification_and_detection](https://github.com/mlperf/inference/tree/r1.0/vision/classification_and_detection) | tensorflow, pytorch, onnx| coco resized to 300x300 [[**automation**](../datasets/coco2017.md)]| 
| ssd-resnet34 1200x1200 | [vision/classification_and_detection](https://github.com/mlperf/inference/tree/r1.0/vision/classification_and_detection) | tensorflow, pytorch, onnx | coco resized to 1200x1200 [[**automation**](../datasets/coco2017.md)] |

## All supported models

| model | framework | accuracy | dataset | model link | model source | precision | notes | CK dataset | CK model |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | 
| ssd-mobilenet 300x300 | tensorflow | mAP 0.23 | coco resized to 300x300 | [from tensorflow](http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_coco_2018_01_28.tar.gz) | [from tensorflow](http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_coco_2018_01_28.tar.gz) | fp32 | NHWC |   |   |
| ssd-mobilenet 300x300 quantized finetuned | tensorflow | mAP 0.23594 | coco resized to 300x300 | [from zenodo](https://zenodo.org/record/3252084/files/mobilenet_v1_ssd_8bit_finetuned.tar.gz) | Habana | int8 | ??? |   |   |
| ssd-mobilenet 300x300 symmetrically quantized finetuned | tensorflow | mAP 0.234 | coco resized to 300x300 | [from zenodo](https://zenodo.org/record/3401714/files/ssd_mobilenet_v1_quant_ft_no_zero_point_frozen_inference_graph.pb) | Habana | int8 | ??? |   |   |
| ssd-mobilenet 300x300 | pytorch | mAP 0.23 | coco resized to 300x300 | [from zenodo](https://zenodo.org/record/3239977/files/ssd_mobilenet_v1.pytorch) | [from tensorflow](http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_coco_2018_01_28.tar.gz) | fp32 | NHWC |   |   |
| ssd-mobilenet 300x300 | onnx | mAP 0.23 | coco resized to 300x300 | from zenodo [opset-8](https://zenodo.org/record/3163026/files/ssd_mobilenet_v1_coco_2018_01_28.onnx), [opset-11](https://zenodo.org/record/4735652/files/ssd_mobilenet_v1_coco_2018_01_28.onnx) | [from tensorflow](http://download.tensorflow.org/models/object_detection/ssd_mobilenet_v1_coco_2018_01_28.tar.gz) converted using [this script](https://github.com/mlcommons/inference/blob/master/vision/classification_and_detection/tools/convert-to-onnx.sh) | fp32 | NHWC, tested on onnxruntime, some runtime warnings |   |   |
| ssd-mobilenet 300x300 | onnx, pytorch | mAP 0.23 | coco resized to 300x300  | [from zenodo](https://zenodo.org/record/3252084/files/mobilenet_v1_ssd_8bit_finetuned.tar.gz) | ??? | int8 | ??? |   |   |
| ssd-resnet34 1200x1200 | tensorflow | mAP 0.20 | coco resized to 1200x1200| [from zenodo](https://zenodo.org/record/3345892/files/tf_ssd_resnet34_22.1.zip?download=1) | [from mlperf](https://github.com/mlperf/inference/tree/master/others/cloud/single_stage_detector/tensorflow), [training model](https://github.com/lji72/inference/tree/tf_ssd_resent34_align_onnx/others/cloud/single_stage_detector/tensorflow) | fp32 | NCHW |   |   |
| ssd-resnet34 1200x1200 | pytorch | mAP 0.20 | coco resized to 1200x1200 | [from zenodo](https://zenodo.org/record/3236545/files/resnet34-ssd1200.pytorch) | [from mlperf](https://github.com/mlperf/inference/tree/master/others/cloud/single_stage_detector/pytorch) | fp32 | NCHW |   |   |
| ssd-resnet34 1200x1200 | onnx | mAP 0.20 | coco resized to 1200x1200 | from zenodo [opset-8](https://zenodo.org/record/3228411/files/resnet34-ssd1200.onnx) | [from mlperf](https://github.com/mlperf/inference/tree/master/others/cloud/single_stage_detector) converted using the these [instructions](https://github.com/BowenBao/inference/tree/master/cloud/single_stage_detector/pytorch#6-onnx) | fp32 | Converted from pytorch model. |   |   |
| ssd-resnet34 1200x1200 | onnx | mAP 0.20 | coco resized to 1200x1200 | from zenodo [opset-11](https://zenodo.org/record/4735664/files/ssd_resnet34_mAP_20.2.onnx) | [from zenodo](https://zenodo.org/record/3345892/files/tf_ssd_resnet34_22.1.zip) converted using [this script](https://github.com/mlcommons/inference/blob/master/vision/classification_and_detection/tools/convert-to-onnx.sh) | fp32 | Converted from the tensorflow model and uses the same interface as the tensorflow model. |   |   |

## Common CK setup

```
python3 -m pip install ck
ck pull repo:octoml@venv

ck create venv:mlperf-inference --template=mlperf-inference-1.0

ck activate venv:mlperf-inference
```



**TBD**
