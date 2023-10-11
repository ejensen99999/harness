#!/usr/bin/env bash

mkdir -m 777 -p client-tools/kustomize/v4.5.4
&& curl -s -L -o client-tools/kustomize/v4.5.4/kustomize https://app.harness.io/public/shared/tools/kustomize/release/v4.5.4/bin/linux/$TARGETARCH/kustomize
&& export PATH=/opt/harness-delegate/client-tools/kustomize/v4.5.4/:$PATH
  