FROM harness/delegate:latest

USER 0

ENV TARGETARCH=amd64

RUN apt install software-properties-common -y \
  && add-apt-repository -y 'ppa:deadsnakes/ppa' \
  && add-apt-repository -y 'ppa:git-core/ppa'

RUN apt install -y git \
  && apt install -y jq \
  && apt install -y python3.8 \
  && apt install -y python3-pip \
  && python3 -m pip install pip \
  && python3 --version

RUN mkdir -m 777 -p client-tools/kubectl/v1.24.3 \
  && curl -s -L -o client-tools/kubectl/v1.24.3/kubectl https://app.harness.io/public/shared/tools/kubectl/release/v1.24.3/bin/linux/$TARGETARCH/kubectl \
  && mkdir -m 777 -p client-tools/helm/v2.13.1 \
  && curl -s -L -o client-tools/helm/v2.13.1/helm https://app.harness.io/public/shared/tools/helm/release/v2.13.1/bin/linux/$TARGETARCH/helm \
  && mkdir -m 777 -p client-tools/helm/v3.1.2 \
  && curl -s -L -o client-tools/helm/v3.1.2/helm https://app.harness.io/public/shared/tools/helm/release/v3.1.2/bin/linux/$TARGETARCH/helm \
  && mkdir -m 777 -p client-tools/helm/v3.8.0 \
  && curl -s -L -o client-tools/helm/v3.8.0/helm https://app.harness.io/public/shared/tools/helm/release/v3.8.0/bin/linux/$TARGETARCH/helm \
  && mkdir -m 777 -p client-tools/go-template/v0.4.2 \
  && curl -s -L -o client-tools/go-template/v0.4.2/go-template https://app.harness.io/public/shared/tools/go-template/release/v0.4.2/bin/linux/$TARGETARCH/go-template \
  && mkdir -m 777 -p client-tools/harness-pywinrm/v0.4-dev \
  && curl -s -L -o client-tools/harness-pywinrm/v0.4-dev/harness-pywinrm https://app.harness.io/public/shared/tools/harness-pywinrm/release/v0.4-dev/bin/linux/$TARGETARCH/harness-pywinrm \
  && mkdir -m 777 -p client-tools/chartmuseum/v0.15.0 \
  && curl -s -L -o client-tools/chartmuseum/v0.15.0/chartmuseum https://app.harness.io/public/shared/tools/chartmuseum/release/v0.15.0/bin/linux/$TARGETARCH/chartmuseum \
  && mkdir -m 777 -p client-tools/tf-config-inspect/v1.2 \
  && curl -s -L -o client-tools/tf-config-inspect/v1.2/terraform-config-inspect https://app.harness.io/public/shared/tools/terraform-config-inspect/v1.2/linux/$TARGETARCH/terraform-config-inspect \
  && mkdir -m 777 -p client-tools/oc/v4.2.16 \
  && curl -s -L -o client-tools/oc/v4.2.16/oc https://app.harness.io/public/shared/tools/oc/release/v4.2.16/bin/linux/$TARGETARCH/oc \
  && mkdir -m 777 -p client-tools/kustomize/v4.5.4 \
  && curl -s -L -o client-tools/kustomize/v4.5.4/kustomize https://app.harness.io/public/shared/tools/kustomize/release/v4.5.4/bin/linux/$TARGETARCH/kustomize \
  && mkdir -m 777 -p client-tools/scm/f1024c6b \
  && curl -s -L -o client-tools/scm/f1024c6b/scm https://app.harness.io/public/shared/tools/scm/release/f1024c6b/bin/linux/$TARGETARCH/scm \
  && chmod -R 775 /opt/harness-delegate \
  && chgrp -R 0 /opt/harness-delegate  \
  && chown -R 1001 /opt/harness-delegate

RUN pip3 install azure-cli==2.52.0 \
  && apt autoremove 

ENV PATH=/opt/harness-delegate/client-tools/kubectl/v1.24.3/:$PATH
ENV PATH=/opt/harness-delegate/client-tools/go-template/v0.4.2/:$PATH
ENV PATH=/opt/harness-delegate/client-tools/chartmuseum/v0.15.0/:$PATH
ENV PATH=/opt/harness-delegate/client-tools/tf-config-inspect/v1.2/:$PATH
ENV PATH=/opt/harness-delegate/client-tools/kustomize/v4.5.4/:$PATH

USER 1001