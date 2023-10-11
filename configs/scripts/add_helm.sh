#!/usr/bin/env bash

mkdir -m 777 -p client-tools/helm/v2.13.1 
mkdir -m 777 -p client-tools/helm/v3.1.2
mkdir -m 777 -p client-tools/helm/v3.8.0

curl -s -L -o client-tools/helm/v2.13.1/helm https://app.harness.io/public/shared/tools/helm/release/v2.13.1/bin/linux/$TARGETARCH/helm 
curl -s -L -o client-tools/helm/v3.1.2/helm https://app.harness.io/public/shared/tools/helm/release/v3.1.2/bin/linux/$TARGETARCH/helm 
curl -s -L -o client-tools/helm/v3.8.0/helm https://app.harness.io/public/shared/tools/helm/release/v3.8.0/bin/linux/$TARGETARCH/helm 