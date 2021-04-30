# MLPerf automation

## Preparing a platform
Prepare your platform for MLPerf automation using the following guidelines:

* [AMD Milan (Ubuntu)](platform/amd-milan.md)
* [x8664 (Ubuntu)](platform/x8664-ubuntu.md)
* [Raspberry Pi4 (Ubuntu)](platform/rpi4-ubuntu.md)
* [Raspberry Pi4 with Coral EdgeTPU (Ubuntu)](platform/rpi4-coral-ubuntu.md)
* [Raspberry Pi4 (Debian)](platform/rpi4-debian.md)
* [Nvidia generic](platform/nvidia-generic.md)
* [Nvidia Jetson Nano](platform/nvidia-jetson-nano.md)

### CK framework

Install [CK](https://github.com/ctuning/ck) and dependencies as described [here](https://ck.readthedocs.io/en/latest/src/installation.html):

```
pip3 install ck
```
or 
```
python3 -m pip install ck
```
or
```
pip3 install ck
```

Check that ck CLI is available:
```
fursin@rpi4:~$ ck

CK version: 1.55.12

Python executable used by CK: /home/fursin/.pyenv/versions/3.7.6/bin/python3.7

Python version used by CK: 3.7.6 (default, Mar  9 2021, 04:42:58)
   [GCC 7.5.0]

Path to the default repo: /home/fursin/.pyenv/versions/3.7.6/lib/python3.7/site-packages/ck/repo
Path to the local repo:   /home/fursin/CK/local/venv/ck-octoml-amd/CK/local
Path to CK repositories:  /home/fursin/CK/local/venv/ck-octoml-amd/CK

Documentation:        https://github.com/ctuning/ck/wiki
CK Google group:      https://bit.ly/ck-google-group
CK Slack channel:     https://cKnowledge.org/join-slack
Stable CK components: https://cKnowledge.io
```

Sometimes you may need to add "~.local/bin/ck" to your PATH or restart your shell.

### Virtual CK environment

You can use the [virtual CK environment](https://github.com/octoml/ck-venv) to avoid mixing up your current Python installation as follows:
```
ck pull repo --url=https://github.com/octoml/ck-venv
ck create venv:test
ck activate venv:test
```

### Adaptive CK containers

You can also use [adaptive CK containers](https://github.com/octoml/ck-venv/blob/main/README.docker.md)
with the CK CLI as follows:

```
ck pull repo --url=https://github.com/octoml/ck-venv
ck ls docker
ck build docker:ck-template-ml-x8664-ubuntu-20.04
ck run docker:ck-template-ml-x8664-ubuntu-20.04
```

## Preparing tasks

* [DLRM](tasks/dlrm.md)

* [Search for CK program workflows with "mlperf"](https://cknowledge.io/?q=module_uoa%3A%22program%22+AND+mlperf)
* [Search for CK program workflows with "loadgen"](https://cknowledge.io/?q=module_uoa%3A%22program%22+AND+loadgen)

## Preparing datasets

## Preparing models

* [notes](models/notes.md)

## Navigating through MLPerf inference results

Master GitHub for inference: https://github.com/mlcommons/inference

### v1.0

Announcements: 
* https://mlcommons.org/en/news/mlperf-inference-v10/

* [IEEE Spectrum](https://spectrum.ieee.org/tech-talk/artificial-intelligence/machine-learning/these-might-be-the-fastest-and-most-efficient-ai-systems-around)
* [ZDNet](https://www.zdnet.com/article/ai-industrys-performance-benchmark-mlperf-for-the-first-time-also-measures-the-energy-that-machine-learning-consumes/)
* [AnandTech](https://www.anandtech.com/show/16632/mlperf-inference-v10-2000-suite-results-new-power-measurements)

* [MLCommons community meeting notes](https://docs.google.com/presentation/d/1w0BfO-S7sEA3kTmxUPaJvpHjHQgP10zf2FcRyR2Vmmc/edit#slide=id.gd34e303737_3_6)


Results:
* https://mlcommons.org/en/inference-datacenter-10/
* https://mlcommons.org/en/inference-edge-10/

GitHub with results, code and data:
* https://github.com/mlcommons/inference_results_v1.0 (2.8GB)
  
### v0.7

Announcement:
* https://mlcommons.org/en/news/mlperf-inference-v07/

Results:
* https://mlcommons.org/en/inference-datacenter-07/
* https://mlcommons.org/en/inference-edge-07/
* https://mlcommons.org/en/inference-mobile-07/

GitHub with results, code and data:
* https://github.com/mlcommons/inference_results_v0.7 (2.5GB)
* https://github.com/mlcommons/inference_results_v0.5 (13GB)

## Reproducing MLPerf inference results

### Using ad-hoc MLCommons scripts

* [Dell EMC System intefernce v0.7](https://infohub.delltechnologies.com/p/running-the-mlperf-inference-v0-7-benchmark-on-dell-emc-systems)
* [NVidia Jetson Xavier](reproduce/image-classification-nvidia-jetson-xavier-mlperf.md)

### Using CK workflows

* [Official MLCommons notes for image classification (a bit outdated - more automation exists)](https://github.com/mlcommons/inference/tree/master/vision/classification_and_detection/optional_harness_ck/classification)
* [Official MLCommons notes for object detection (a bit outdated - more automations exists)](https://github.com/mlcommons/inference/tree/master/vision/classification_and_detection/optional_harness_ck/detection)


### Image Classification

* [x86, Arm, Nvdia, EdgeTPU](reproduce-ck/image-classification-tflite.md)

#### Object detection

* [Coral EdgeTPU on RPi4 with TFlite](reproduce-ck/object-detection-rpi4-coral-tflite.md)
* [RPi4 with TFlite](reproduce-ck/object-detection-rpi4-tflite.md)

### Using adaptive CK containers


## Recording experiments

## Visualizing results

## Exploring ML Systems design space and autotuning models

Examples:
* [CK based object detection DSE notebook](https://nbviewer.jupyter.org/urls/dl.dropbox.com/s/f28u9epifr0nn09/ck-dse-demo-object-detection.ipynb)
  * [CK dashboard](https://cknowledge.io/result/crowd-benchmarking-mlperf-inference-classification-mobilenets-all)

* [ACM ASPLOS REQUEST DSE tournament](https://cknowledge.io/c/event/repro-request-asplos2018)
  * [CK dashboard](https://cknowledge.io/c/result/pareto-efficient-ai-co-design-tournament-request-acm-asplos-2018)

## Packing and sharing results

## Submitting to MLPerf

* https://mlcommons.org/en/get-involved

* https://github.com/mlcommons/policies/blob/master/submission_rules.adoc
* https://github.com/mlcommons/inference/blob/master/SubmissionExample.ipynb


* [Misc inference notes](inference/notes.md)
  * [Generate target latency via CK repos](https://cknowledge.io/c/program/generate-target-latency)
  * [Image classification with TFlite across 4 machines with CK notebook](https://nbviewer.jupyter.org/github/ctuning/ck-ml/blob/main/jnotebook/image-classification-tflite-loadgen/image-classification-tflite-loadgen.ipynb)
  * [Dump CK repo to submission](https://cknowledge.io/c/program/dump-repo-to-submission)

## MLPerf tools

* [LoadGen (how to build without CK)](https://github.com/mlcommons/inference/blob/master/loadgen/README_BUILD.md)
* [MLCube](tools/mlcube.md) (complementary to CK - plans to connect it with the CK framework)
* [Logging](tools/logging.md)

## Further improvements

* [Automation](tbd-automation.md)
* [CK2 ideas](tbd-ck2.md)
