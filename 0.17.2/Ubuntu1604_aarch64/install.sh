#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=177Y9EuGMWXh2jX_LHehHNFO8YpPYAp8z" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=177Y9EuGMWXh2jX_LHehHNFO8YpPYAp8z" -o bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
