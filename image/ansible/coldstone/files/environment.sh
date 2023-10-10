#!/usr/bin/env bash

export HOME=/home/runner
export PATH="${PATH}:${HOME}/.local/bin"
export ImageOS=ubuntu20

echo "PATH=${PATH}" > /etc/environment \
    && echo "ImageOS=${ImageOS}" >> /etc/environment
