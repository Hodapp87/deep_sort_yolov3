#!/bin/sh

# (don't forget to source your venv)

# See the dependencies at:
# https://docs.nvidia.com/deeplearning/frameworks/install-tf-jetson-platform/index.html
# sudo apt-get install libhdf5-serial-dev hdf5-tools libhdf5-dev zlib1g-dev zip libjpeg8-dev liblapack-dev libblas-dev gfortran
# sudo apt-get install python3-pip
# sudo pip3 install -U pip testresources setuptools

sudo apt install python3-opencv
# Copy the .so into the venv too (see opencv_to_venv.sh for example)

# Note that this is for JetPack 4.4:
pip3 install Cython
TMPDIR=./tmp pip3 install \
    --pre --no-cache-dir --extra-index-url \
    https://developer.download.nvidia.com/compute/redist/jp/v44 \
    tensorflow numpy sklearn Pillow imutils keras
