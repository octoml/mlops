You can use [adaptive CK containers](https://github.com/octoml/ck-venv/blob/main/README.docker.md)
with the CK CLI as follows:

```
ck pull repo --url=https://github.com/octoml/ck-venv
ck ls docker
ck build docker:ck-template-ml-x8664-ubuntu-20.04
ck run docker:ck-template-ml-x8664-ubuntu-20.04
```
