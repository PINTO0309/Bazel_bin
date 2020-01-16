#!/bin/bash

curl -sc /tmp/cookie "https://drive.google.com/uc?export=download&id=110Dg8AnIDeRT7r9vRZdQD6EEx_O1POSB" > /dev/null
CODE="$(awk '/_warning_/ {print $NF}' /tmp/cookie)"
curl -Lb /tmp/cookie "https://drive.google.com/uc?export=download&confirm=${CODE}&id=110Dg8AnIDeRT7r9vRZdQD6EEx_O1POSB" -o bazel
sudo chmod +x bazel
sudo cp ./bazel /usr/local/bin
rm ./bazel
