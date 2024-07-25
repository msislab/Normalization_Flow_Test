ARG BASE_IMAGE=python:3.11
FROM $BASE_IMAGE

# ARGUMENTS
LABEL maintainer=rizwan

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    && rm -rf /var/lib/apt/lists/*
# add pip packages when necessary
RUN pip install --upgrade pip
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt --no-cache-dir
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118	
RUN pip install opencv-python
WORKDIR /
COPY ./ /Normalization_Flow_Test
ARG USER_NAME=normalization_flow 
