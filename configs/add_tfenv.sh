#!/usr/bin/env bash

git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv \
  && echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile \
  && echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bashrc