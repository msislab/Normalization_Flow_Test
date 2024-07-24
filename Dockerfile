ARG BASE_IMAGE=python:3.11
FROM $BASE_IMAGE
# ARGUMENTS
LABEL maintainer=rizwan

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    && rm -rf /var/lib/apt/lists/*
# add pip packages when necessary
RUN python3 -m pip install --upgrade pip
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt --no-cache-dir

ARG USER_NAME=normalization_flow 