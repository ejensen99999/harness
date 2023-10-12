#!/usr/bin/env bash

chmod -R 775 /opt/harness-delegate \
  && chgrp -R 0 /opt/harness-delegate \
  && chown -R 1001 /opt/harness-delegate