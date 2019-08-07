#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1N8SfWY_13dQJGyEEUH_t9HHOZGlyUeVb" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1N8SfWY_13dQJGyEEUH_t9HHOZGlyUeVb" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
