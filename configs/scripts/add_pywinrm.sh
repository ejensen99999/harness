#!/usr/bin/env bash

mkdir -m 777 -p client-tools/harness-pywinrm/v0.4-dev \
    && curl -s -L -o client-tools/harness-pywinrm/v0.4-dev/harness-pywinrm https://app.harness.io/public/shared/tools/harness-pywinrm/release/v0.4-dev/bin/linux/$TARGETARCH/harness-pywinrm 
  