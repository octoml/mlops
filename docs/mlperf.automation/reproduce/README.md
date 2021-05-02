# Reproduce MLPerf benchmark

## Using ad-hoc MLCommons scripts

* [Dell EMC System intefernce v0.7](https://infohub.delltechnologies.com/p/running-the-mlperf-inference-v0-7-benchmark-on-dell-emc-systems)
* [NVidia Jetson Xavier](reproduce/image-classification-nvidia-jetson-xavier-mlperf.md)

## Using CK workflows

* [Official MLCommons notes for image classification (a bit outdated - more automation exists)](https://github.com/mlcommons/inference/tree/master/vision/classification_and_detection/optional_harness_ck/classification)
* [Official MLCommons notes for object detection (a bit outdated - more automations exists)](https://github.com/mlcommons/inference/tree/master/vision/classification_and_detection/optional_harness_ck/detection)

## Using CK adaptive containers

* [MLPerf workflows](https://cknowledge.io/?q=module_uoa%3A%22docker%22+AND+%22mlperf%22)

* [CK image classification](https://cknowledge.io/?q=module_uoa%3A%22docker%22+AND+%22image-classification%22)
* [CK object detection](https://cknowledge.io/?q=module_uoa%3A%22docker%22+AND+%22object-detection%22)


# Case studies

### Image Classification

* [x86, Arm, Nvdia, EdgeTPU](ck-image-classification-tflite.md)

#### Object detection

* [AMD (x8664) with TFlite](ck-object-detection-x86-64.md)
* [Coral EdgeTPU on RPi4 with TFlite](ck-object-detection-rpi4-coral-tflite.md)
* [RPi4 with TFlite](ck-object-detection-rpi4-tflite.md)
