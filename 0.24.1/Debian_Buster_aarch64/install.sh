#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1SyfrRqX-6KF_KxD4PBVQLT35tgI8Sf58" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1SyfrRqX-6KF_KxD4PBVQLT35tgI8Sf58" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
