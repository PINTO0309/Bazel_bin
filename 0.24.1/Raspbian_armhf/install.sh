#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1YnT6tt5jHbAxvtBFfZmn6aewRQdSD43N" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1YnT6tt5jHbAxvtBFfZmn6aewRQdSD43N" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
