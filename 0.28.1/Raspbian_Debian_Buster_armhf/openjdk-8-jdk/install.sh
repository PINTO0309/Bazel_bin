#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1pdWOQ1BDvtrd8UIBpbhHOkXAych-0mBH" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1pdWOQ1BDvtrd8UIBpbhHOkXAych-0mBH" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
