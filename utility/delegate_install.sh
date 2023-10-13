#!/usr/bin/env bash

echo "here"

docker run --cpus=1 --memory=2g \
  -e DELEGATE_NAME=custom-delegate \
  -e NEXT_GEN="true" \
  -e DELEGATE_TYPE="DOCKER" \
  -e ACCOUNT_ID=fQlxjFqlTgqv_gPDCPsIcA \
  -e DELEGATE_TOKEN=MzNlZGVhYzAzNmI0YzkyMTFmMmY1OTA5OTZiOGUwNTY= \
  -e LOG_STREAMING_SERVICE_URL=https://app.harness.io/log-service/ \
  -e MANAGER_HOST_AND_PORT=https://app.harness.io \
  ubuntu_base_image:latest

  echo "there"