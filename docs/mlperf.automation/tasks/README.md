# MLPerf tasks:

## MLPerf Inference v1.0 (submission 03/19/2020)
Use the r1.0 branch (```git checkout r1.0```) if you want to submit or reproduce v1.0 results.

See the individual Readme files in the reference app for details.

| model | reference app | framework | dataset |
| ---- | ---- | ---- | ---- |
| resnet50-v1.5 | [vision/classification_and_detection](https://github.com/mlperf/inference/tree/r1.0/vision/classification_and_detection) | tensorflow, pytorch, onnx | imagenet2012 [[**automation**](../datasets/imagenet2012.md)] |
| ssd-mobilenet 300x300 | [vision/classification_and_detection](https://github.com/mlperf/inference/tree/r1.0/vision/classification_and_detection) | tensorflow, pytorch, onnx| coco resized to 300x300 [[**automation**](../datasets/coco2017.md)]| 
| ssd-resnet34 1200x1200 | [vision/classification_and_detection](https://github.com/mlperf/inference/tree/r1.0/vision/classification_and_detection) | tensorflow, pytorch, onnx | coco resized to 1200x1200 [[**automation**](../datasets/coco2017.md)] |
| bert | [language/bert](https://github.com/mlperf/inference/tree/r1.0/language/bert) | tensorflow, pytorch, onnx | squad-1.1 |
| dlrm | [recommendation/dlrm](https://github.com/mlperf/inference/tree/r1.0/recommendation/dlrm/pytorch) | pytorch, tensorflow(?), onnx(?) | Criteo Terabyte |
| 3d-unet | [vision/medical_imageing/3d-unet](https://github.com/mlperf/inference/tree/r1.0/vision/medical_imaging/3d-unet) | pytorch, tensorflow(?), onnx(?) | BraTS 2019 |
| rnnt | [speech_recognition/rnnt](https://github.com/mlperf/inference/tree/r1.0/speech_recognition/rnnt) | pytorch | OpenSLR LibriSpeech Corpus |


* [CK datasets](../datasets/README.md)





# Unsorted related to CK automation

* [Notes about models (issues, quantization, etc)](../models/notes.md)

* DLRM: [notes](dlrm.md), [CK packages](https://cknowledge.io/?q=module_uoa%3A%22program%22+AND+dlrm), [CK workflows](https://cknowledge.io/?q=module_uoa%3A%22program%22+AND+dlrm)
* [Search for CK program workflows with "mlperf"](https://cknowledge.io/?q=module_uoa%3A%22program%22+AND+mlperf)
* [Search for CK program workflows with "loadgen"](https://cknowledge.io/?q=module_uoa%3A%22program%22+AND+loadgen)
