#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1xtdslGZPtNpiNvLFZc92g90v16svHM8R" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1xtdslGZPtNpiNvLFZc92g90v16svHM8R" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
