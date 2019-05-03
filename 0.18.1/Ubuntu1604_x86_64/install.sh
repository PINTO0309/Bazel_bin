#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=15x0bMWmnubt3pNogc1gQkNsOiJ7a-MdK" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=15x0bMWmnubt3pNogc1gQkNsOiJ7a-MdK" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
