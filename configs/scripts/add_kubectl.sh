#!/usr/bin/env bash

mkdir -m 777 -p client-tools/kubectl/v1.24.3
&& curl -s -L -o client-tools/kubectl/v1.24.3/kubectl https://app.harness.io/public/shared/tools/kubectl/release/v1.24.3/bin/linux/$TARGETARCH/kubectl 
&& export PATH=/opt/harness-delegate/client-tools/kubectl/v1.24.3/:$PATH