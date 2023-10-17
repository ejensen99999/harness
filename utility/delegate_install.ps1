# docker run --cpus=1 --memory=2g `
#   -e DELEGATE_NAME=custom-delegate `
#   -e NEXT_GEN="true" `
#   -e DELEGATE_TYPE="DOCKER" `
#   -e ACCOUNT_ID=fQlxjFqlTgqv_gPDCPsIcA `
#   -e DELEGATE_TOKEN=MzNlZGVhYzAzNmI0YzkyMTFmMmY1OTA5OTZiOGUwNTY= `
#   -e LOG_STREAMING_SERVICE_URL=https://app.harness.io/log-service/ `
#   -e MANAGER_HOST_AND_PORT=https://app.harness.io ejensen99999/custom-job-delegate:harness


  docker run --cpus=1 --memory=2g `
  -e DELEGATE_NAME=custom-delegate `
  -e NEXT_GEN="true" `
  -e DELEGATE_TYPE="DOCKER" `
  -e ACCOUNT_ID=fQlxjFqlTgqv_gPDCPsIcA `
  -e DELEGATE_TOKEN=ZjU2NjYyMzE2OWIyZTA2MjFiMDFmZDQ2NWNiNmIzOTM= `
  -e LOG_STREAMING_SERVICE_URL=https://app.harness.io/log-service/ `
  -e MANAGER_HOST_AND_PORT=https://app.harness.io ejensen99999/custom-job-delegate:harness