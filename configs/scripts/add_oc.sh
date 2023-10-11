#!/usr/bin/env bash

mkdir -m 777 -p client-tools/oc/v4.2.16
curl -s -L -o client-tools/oc/v4.2.16/oc https://app.harness.io/public/shared/tools/oc/release/v4.2.16/bin/linux/$TARGETARCH/oc
  