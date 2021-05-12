# MLPerf Inference v1.0: image classification

## Official models

| model | reference app | framework | dataset |
| ---- | ---- | ---- | ---- |
| resnet50-v1.5 | [vision/classification_and_detection](https://github.com/mlperf/inference/tree/r1.0/vision/classification_and_detection) | tensorflow, pytorch, onnx | imagenet2012 [[**automation**](../datasets/imagenet2012.md)] |

## Supported Models

| model | framework | accuracy | dataset | model link | model source | precision | notes | CK dataset tags | CK model tags |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | 
| resnet50-v1.5 | tensorflow | 76.456% | imagenet2012 validation | [from zenodo](https://zenodo.org/record/2535873/files/resnet50_v1.pb) | [mlperf](https://github.com/mlperf/training/tree/master/image_classification), [tensorflow](https://github.com/tensorflow/models/tree/master/official/resnet) | fp32 | NHWC. More information on resnet50 v1.5 can be found [here](https://github.com/tensorflow/models/tree/master/official/resnet).||   |   |
| resnet50-v1.5 | onnx | 76.456% | imagenet2012 validation | from zenodo: [opset-8](https://zenodo.org/record/2592612/files/resnet50_v1.onnx), [opset-11](https://zenodo.org/record/4735647/files/resnet50_v1.onnx) | [from zenodo](https://zenodo.org/record/2535873/files/resnet50_v1.pb) converted with [this script](https://github.com/mlcommons/inference/blob/master/vision/classification_and_detection/tools/convert-to-onnx.sh) | fp32 | NCHW, tested on pytorch and onnxruntime |   |   |
| resnet50-v1.5 | pytorch | 76.014% | imagenet2012 validation | [from zenodo](https://zenodo.org/record/4588417/files/resnet50-19c8e357.pth) | [from TorchVision](https://github.com/pytorch/vision/blob/v0.8.2/torchvision/models/resnet.py) | fp32 | NCHW |   |   |
| resnet50-v1.5 | pytorch | 75.790% | imagenet2012 validation | [from zenodo](https://zenodo.org/record/4589637/files/resnet50_INT8bit_quantized.pt) | Edgecortix [quantization script](tools/calibrate_torchvision_model.py) | A: int8, W: uint8 | NCHW |   |   |
| mobilenet-v1 (depreciated since mlperf-v0.7)| tensorflow | 71.676% | imagenet2012 validation | [from zenodo](https://zenodo.org/record/2269307/files/mobilenet_v1_1.0_224.tgz) | [from tensorflow](http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224.tgz) | fp32 | NHWC |   |   |
| mobilenet-v1 quantized (depreciated since mlperf-v0.7)| tensorflow | 70.694% | imagenet2012 validation | [from zenodo](https://zenodo.org/record/2269307/files/mobilenet_v1_1.0_224_quant.tgz) | [from tensorflow](http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz) | int8 | NHWC |   |   |
| mobilenet-v1 (depreciated since mlperf-v0.7)| tflite | 71.676% | imagenet2012 validation | [from zenodo](https://zenodo.org/record/2269307/files/mobilenet_v1_1.0_224.tgz) | [from tensorflow](http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224.tgz) | fp32 | NHWC |   |   |
| mobilenet-v1 quantized (depreciated since mlperf-v0.7)| tflite | 70.762% | imagenet2012 validation | [from zenodo](https://zenodo.org/record/2269307/files/mobilenet_v1_1.0_224_quant.tgz) | [from tensorflow](http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224_quant.tgz) | int8 | NHWC |   |   |
| mobilenet-v1 (depreciated since mlperf-v0.7)| onnx | 71.676% | imagenet2012 validation | from zenodo: [opset-8](https://zenodo.org/record/3157894/files/mobilenet_v1_1.0_224.onnx), [opset-11](https://zenodo.org/record/4735651/files/mobilenet_v1_1.0_224.onnx) | [from tensorflow](http://download.tensorflow.org/models/mobilenet_v1_2018_08_02/mobilenet_v1_1.0_224.tgz) converted with [this script](https://github.com/mlcommons/inference/blob/master/vision/classification_and_detection/tools/convert-to-onnx.sh) | fp32 | NCHW, tested on pytorch and onnxruntime |   |   |
| mobilenet-v1 (depreciated since mlperf-v0.7)| onnx, pytorch | 70.9% | imagenet2012 validation | [from zenodo](https://zenodo.org/record/3353417/files/Quantized%20MobileNet.zip) | ??? | int8 | ??? |   |   |
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

## CK setup for this task

