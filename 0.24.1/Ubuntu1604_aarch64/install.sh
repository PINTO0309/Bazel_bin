#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1L7eamMzZy2zwasiqZnzITX6ma8WSa3mb" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1L7eamMzZy2zwasiqZnzITX6ma8WSa3mb" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
