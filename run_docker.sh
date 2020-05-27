#!/bin/sh

#nvidia-docker build -t deepsort .
nvidia-docker run -it \
    --gpus all \
    -v '/run/opengl-driver/lib:/lib/cuda:ro' \
    --env LD_LIBRARY_PATH=/lib/cuda \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --device=/dev/video0:/dev/video0 \
    -v $PWD:/root/dev \
    -w /root/dev \
    --ipc host \
    deepsort
