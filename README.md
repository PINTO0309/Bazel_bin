# Bazel_bin
Bazel's prebuilt binary storehouse.

RaspberryPi3 ... Raspbian_armhf  
Ubuntu1604 ... Ubuntu1604_x86_64  
TX2 ... Ubuntu1604_aarch64  

## Usage
```
$ cd ~
$ git clone https://github.com/PINTO0309/Bazel_bin.git

$ cd Bazel_bin/0.17.2/Raspbian_armhf
or
$ cd Bazel_bin/0.17.2/Ubuntu1604_x86_64
or
$ cd Bazel_bin/0.17.2/Ubuntu1604_aarch64

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

## Supplement - Steps for building Bazel
```
$ cd ~
$ mkdir bazel;cd bazel
$ wget https://github.com/bazelbuild/bazel/releases/download/0.17.2/bazel-0.17.2-dist.zip
$ unzip bazel-0.17.2-dist.zip

#==== Only RaspberryPi ============================================================
$ nano bazel/scripts/bootstrap/compile.sh

#################################################################################
  run "${JAVAC}" -classpath "${classpath}" -sourcepath "${sourcepath}" \
      -d "${output}/classes" -source "$JAVA_VERSION" -target "$JAVA_VERSION" \
      -encoding UTF-8 ${BAZEL_JAVAC_OPTS} "@${paramfile}"
#################################################################################
↓
#################################################################################
  run "${JAVAC}" -classpath "${classpath}" -sourcepath "${sourcepath}" \
      -d "${output}/classes" -source "$JAVA_VERSION" -target "$JAVA_VERSION" \
      -encoding UTF-8 ${BAZEL_JAVAC_OPTS} "@${paramfile}" -J-Xmx500M
#################################################################################
#==== Only RaspberryPi ============================================================

$ sudo bash ./compile.sh   #<--- Execute it directly under the bazel folder
$ sudo cp output/bazel /usr/local/bin   #<--- Always execute after completion of build
```
