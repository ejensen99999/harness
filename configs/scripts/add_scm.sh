#!/usr/bin/env bash

mkdir -m 777 -p client-tools/scm/f1024c6b \
    && curl -s -L -o client-tools/scm/f1024c6b/scm https://app.harness.io/public/shared/tools/scm/release/f1024c6b/bin/linux/$TARGETARCH/scm
 