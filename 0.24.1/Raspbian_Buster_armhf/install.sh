#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1iTm4fmCOxKDGTf6k3J_ubAyYdoV1I7LL" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1iTm4fmCOxKDGTf6k3J_ubAyYdoV1I7LL" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
