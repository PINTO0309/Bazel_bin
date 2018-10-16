# Bazel_bin
Bazel's prebuilt binary storehouse.

RaspberryPi3 ... Raspbian_armhf  
Ubuntu1604 ... Ubuntu1604_x86_64 / Ubuntu1604_aarch64  

## Usage
```
$ cd ~
$ git clone https://github.com/PINTO0309/Bazel_bin.git

$ cd Bazel_bin/0.17.2/Raspbian_armhf
or
$ cd Bazel_bin/0.17.2/Ubuntu1604_x86_64

$ ./install.sh
```

## Binary destination folder
```
/usr/local/bin
```

## Execution exmaple
```
$ cd tensorflow
$ ./configure
$ sudo bazel build --config opt --local_resources 1024.0,0.5,0.5 \
--copt=-mfpu=neon-vfpv4 \
--copt=-ftree-vectorize \
--copt=-funsafe-math-optimizations \
--copt=-ftree-loop-vectorize \
--copt=-fomit-frame-pointer \
--copt=-DRASPBERRY_PI \
--host_copt=-DRASPBERRY_PI \
//tensorflow/tools/pip_package:build_pip_package
```
