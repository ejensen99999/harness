#!/usr/bin/env bash

mkdir -m 777 -p client-tools/tf-config-inspect/v1.2
&& curl -s -L -o client-tools/tf-config-inspect/v1.2/terraform-config-inspect https://app.harness.io/public/shared/tools/terraform-config-inspect/v1.2/linux/$TARGETARCH/terraform-config-inspect
&& export PATH=/opt/harness-delegate/client-tools/tf-config-inspect/v1.2/:$PATH
  