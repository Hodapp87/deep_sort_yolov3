#FROM ubuntu:19.10

FROM nvidia/cuda:10.1-base-ubuntu18.04
#FROM nvidia/cuda:10.0-base-ubuntu18.04

# N.B. 10.2 must match with the cuda-*-10-2 packages below.
# If downgrading to 10-0, use cuda-cublas-10-0 rather than libcublas10.

RUN apt-get update -y \
  && apt-get install -y python3-pip \
     libsm6 libxext6 libxrender-dev \
     libcublas10 cuda-cufft-10-1 \
     cuda-curand-10-1 cuda-cusolver-10-1 \
     cuda-cusparse-10-1 libcudnn7 \
     libgstreamer1.0-0 libgstreamer1.0-dev \
     libgstreamer-plugins-base1.0-0 \
     libgstreamer-plugins-base1.0-dev \
     gstreamer1.0-plugins-base \
     gstreamer1.0-plugins-good \
     gstreamer1.0-libav \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip

RUN pip3 install \
    numpy sklearn Pillow imutils \
    opencv-python tensorflow keras

# Before even trying the Python code, *make sure nvidia-smi runs*
# without producing a "Driver/library version mismatch" error.

# Unsolved but maybe irrelevant:
# ERROR: tensorboard 1.15.0 has requirement setuptools>=41.0.0, but you'll have setuptools 39.0.1 which is incompatible
