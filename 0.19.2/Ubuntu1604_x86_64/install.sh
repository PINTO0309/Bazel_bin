#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1-bdNcHFNOhS5r5pFfd40O71yv60LhdT7" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1-bdNcHFNOhS5r5pFfd40O71yv60LhdT7" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
