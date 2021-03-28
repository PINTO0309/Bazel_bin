#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=1xeUKKZeQMz_37DTzBUUXl01m-Nv97WZO" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=1xeUKKZeQMz_37DTzBUUXl01m-Nv97WZO" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
