#!/usr/bin/env bash

mkdir -m 777 -p client-tools/go-template/v0.4.2 \
    && curl -s -L -o client-tools/go-template/v0.4.2/go-template https://app.harness.io/public/shared/tools/go-template/release/v0.4.2/bin/linux/$TARGETARCH/go-template \
    && export PATH=/opt/harness-delegate/client-tools/go-template/v0.4.2/:$PATH
  