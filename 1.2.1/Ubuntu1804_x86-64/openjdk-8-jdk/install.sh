#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1Gv_ocEIpA92suPr92P1VvAp7KkB3BV2s" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1Gv_ocEIpA92suPr92P1VvAp7KkB3BV2s" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
