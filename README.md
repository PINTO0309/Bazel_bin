# Bazel_bin
Bazel's prebuilt binary storehouse.

RaspberryPi3 ... Raspbian_armhf  
Ubuntu1604 ... Ubuntu1604_x86_64  
TX2 ... Ubuntu1604_aarch64  

## Usage
```bash
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
```bash
/usr/local/bin
```

## Execution exmaple
```bash
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
### Example: 0.19.2 or less
```bash
$ sudo apt-get install build-essential openjdk-8-jdk python zip unzip
$ cd ~
$ mkdir bazel;cd bazel
$ wget https://github.com/bazelbuild/bazel/releases/download/0.19.2/bazel-0.19.2-dist.zip
$ unzip bazel-0.19.2-dist.zip

#==== Only RaspberryPi ============================================================
$ nano scripts/bootstrap/compile.sh

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

### Example: 0.20.0 or more
```bash
$ sudo apt-get install build-essential openjdk-8-jdk python zip unzip
$ cd ~
$ mkdir bazel;cd bazel
$ wget https://github.com/bazelbuild/bazel/releases/download/0.24.1/bazel-0.24.1-dist.zip
$ unzip bazel-0.24.1-dist.zip
$ env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk"

#==== Only RaspberryPi ============================================================
$ nano compile.sh

#################################################################################
bazel_build "src:bazel_nojdk${EXE_EXT}" \
  --action_env=PATH \
  --host_platform=@bazel_tools//platforms:host_platform \
  --platforms=@bazel_tools//platforms:target_platform \
  || fail "Could not build Bazel"
#################################################################################
↓
#################################################################################
bazel_build "src:bazel_nojdk${EXE_EXT}" \
  --host_javabase=@local_jdk//:jdk \
  --action_env=PATH \
  --host_platform=@bazel_tools//platforms:host_platform \
  --platforms=@bazel_tools//platforms:target_platform \
  || fail "Could not build Bazel"
#################################################################################

$ nano scripts/bootstrap/compile.sh

#################################################################################
  run "${JAVAC}" -classpath "${classpath}" -sourcepath "${sourcepath}" \
      -d "${output}/classes" -source "$JAVA_VERSION" -target "$JAVA_VERSION" \
      -encoding UTF-8 ${BAZEL_JAVAC_OPTS} "@${paramfile}"
#################################################################################
↓
#################################################################################
  run "${JAVAC}" -classpath "${classpath}" -sourcepath "${sourcepath}" \
      -d "${output}/classes" -source "$JAVA_VERSION" -target "$JAVA_VERSION" \
      -encoding UTF-8 ${BAZEL_JAVAC_OPTS} "@${paramfile}" -J-Xmx800M
#################################################################################
#==== Only RaspberryPi ============================================================

$ sudo bash ./compile.sh   #<--- Execute it directly under the bazel folder
$ sudo cp output/bazel /usr/local/bin   #<--- Always execute after completion of build
```
