#!/usr/bin/env bash

export ARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) \
    && if [ "$ARCH" = "arm64" ]; then export ARCH=aarch64 ; fi \
    && if [ "$ARCH" = "amd64" ] || [ "$ARCH" = "i386" ]; then export ARCH=x86_64 ; fi \
    && curl -f -L -o /usr/local/bin/dumb-init "https://github.com/Yelp/dumb-init/releases/download/v${DUMB_INIT_VERSION}/dumb-init_${DUMB_INIT_VERSION}_${ARCH}" \
    && chmod +x /usr/local/bin/dumb-init