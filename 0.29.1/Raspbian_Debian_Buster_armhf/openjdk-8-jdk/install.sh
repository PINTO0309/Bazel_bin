#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=10Xv4rr1ndOsZnHEiDHjOnIzAnyuhp2mn" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=10Xv4rr1ndOsZnHEiDHjOnIzAnyuhp2mn" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
