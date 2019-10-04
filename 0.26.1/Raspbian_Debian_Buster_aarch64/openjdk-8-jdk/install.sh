#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=12q-6_lXVsHwQ09K1DA96LMtLuSZYqlR3" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=12q-6_lXVsHwQ09K1DA96LMtLuSZYqlR3" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
