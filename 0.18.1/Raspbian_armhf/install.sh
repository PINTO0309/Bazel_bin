#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=11Xhm-Bvale_Z4fSGGSFGY1wlgv21k2RO" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=11Xhm-Bvale_Z4fSGGSFGY1wlgv21k2RO" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
