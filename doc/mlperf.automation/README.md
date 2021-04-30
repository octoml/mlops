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

## Preparing datasets

## Preparing models

## Using native MLCommons inference benchmarking

## Reproducing MLPerf results using CK workflows

### Object detection

* [Coral EdgeTPU on RPi4 with TFlite](reproduce-ck/object-detection-rpi4-coral-tflite.md)
* [RPi4 with TFlite](reproduce-ck/object-detection-rpi4-tflite.md)

## Using adaptive CK containers for MLCommons inference benchmarking

## Recording experiments

## Visualizing results

### CK dashboard

### Jupyter notebook

## Exploring ML Systems design space and autotuning models

## Packing and sharing results

## Submitting to MLPerf

* [Misc inference notes](inference/notes.md)

## Further improvements

* [Automation](tbd-automation.md)
* [CK2 ideas](tbd-ck2.md)
