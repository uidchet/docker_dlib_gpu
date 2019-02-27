FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04
RUN apt-get update
RUN apt-get install cmake -y
RUN apt-get install -y python3
RUN apt-get install -y python3-dev
RUN apt-get update
RUN apt-get install -y libblas-dev liblapack-dev libatlas-base-dev
RUN apt-get install -y git
RUN git clone https://github.com/davisking/dlib.git
RUN apt-get install -y python3-pip
RUN pip3 install --user setuptools
RUN cd dlib && python3 setup.py install --record files.txt --yes USE_AVX_INSTRUCTIONS --yes DLIB_USE_CUDA --compiler-flags "-DCUDA_HOST_COMPILER=/usr/bin/gcc-7"
RUN python3 -c "import dlib; print(dlib.DLIB_USE_CUDA)"
