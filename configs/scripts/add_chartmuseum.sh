#!/usr/bin/env bash

mkdir -m 777 -p client-tools/chartmuseum/v0.15.0
&& curl -s -L -o client-tools/chartmuseum/v0.15.0/chartmuseum https://app.harness.io/public/shared/tools/chartmuseum/release/v0.15.0/bin/linux/$TARGETARCH/chartmuseum
&& export PATH=/opt/harness-delegate/client-tools/chartmuseum/v0.15.0/:$PATH
  