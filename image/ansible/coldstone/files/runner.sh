#!/usr/bin/env bash

export ARCH=$(echo ${TARGETPLATFORM} | cut -d / -f2) \
    && if [ "$ARCH" = "amd64" ] || [ "$ARCH" = "x86_64" ] || [ "$ARCH" = "i386" ]; then export ARCH=x64 ; fi \
    && mkdir -p "${RUNNER_HOME}" \
    && mkdir -p "${RUNNER_HOOKS_DIR}" \
    && mkdir -p "${RUNNER_ASSETS_DIR}" \
    && cd "${RUNNER_ASSETS_DIR}" \
    && latest_version_label=$(curl -s -X GET "https://api.github.com/repos/actions/runner/releases/latest" | jq -r ".tag_name") \
    && latest_version=$(echo ${latest_version_label:1}) \
    && curl -f -L -o runner.tar.gz "https://github.com/actions/runner/releases/download/v${latest_version}/actions-runner-linux-${ARCH}-${latest_version}.tar.gz" \
    && curl -f -L -o runner-container-hooks.zip "https://github.com/actions/runner-container-hooks/releases/download/v${RUNNER_CONTAINER_HOOKS_VERSION}/actions-runner-hooks-k8s-${RUNNER_CONTAINER_HOOKS_VERSION}.zip" \
    && tar xzf ./runner.tar.gz \
    && unzip ./runner-container-hooks.zip -d ./k8s \
    && rm runner.tar.gz \
    && rm runner-container-hooks.zip \
    && ./bin/installdependencies.sh \
    && mv ./externals ./externalstmp \
    && apt-get install -y libyaml-dev \
    && rm -rf /var/lib/apt/lists/*