#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1RR2LAhMJM0z7Cxzah4CeLjJft8BJ9AjQ" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1RR2LAhMJM0z7Cxzah4CeLjJft8BJ9AjQ" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
