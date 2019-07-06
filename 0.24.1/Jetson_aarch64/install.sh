#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1Wl8b36UJWPNlkT4v4gQiKkSkD71SN64K" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1Wl8b36UJWPNlkT4v4gQiKkSkD71SN64K" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
