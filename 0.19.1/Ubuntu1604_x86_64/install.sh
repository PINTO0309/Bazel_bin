#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=13zEKn1pvVlPS-DjZcQNjYfAbcVkQK12L" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=13zEKn1pvVlPS-DjZcQNjYfAbcVkQK12L" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
