FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
RUN apt-get update
RUN apt-get install cmake
RUN apt-get install python3-dev
RUN apt-get install build-dep python3
RUN apt-get update
RUN apt-get install libblas-dev liblapack-dev libatlas-base-dev
RUN apt-get install git
RUN git clone https://github.com/davisking/dlib.git
RUN python3 setup.py install --record files.txt --yes USE_AVX_INSTRUCTIONS --yes DLIB_USE_CUDA --compiler-flags "-DCUDA_HOST_COMPILER=/usr/bin/gcc-6"
RUN python3 -c "import dlib; print(dlib.DLIB_USE_CUDA)"
