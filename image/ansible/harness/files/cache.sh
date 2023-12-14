#!/usr/bin/env bash

mkdir /opt/hostedtoolcache \
    && chgrp docker /opt/hostedtoolcache \
    && chmod g+rwx /opt/hostedtoolcache