#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1tiTGdR5s11MAChrMolBuDWd7oFt0Ifuj" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1tiTGdR5s11MAChrMolBuDWd7oFt0Ifuj" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
