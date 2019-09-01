#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1BhlJONyWj25hK63_YD7LrBu50h-1Ae_g" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1BhlJONyWj25hK63_YD7LrBu50h-1Ae_g" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel

