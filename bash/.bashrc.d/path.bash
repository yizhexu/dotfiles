#!/usr/bin/env bash
# -*- mode: sh -*-

pathconcat /usr/local/sbin
pathconcat /usr/local/bin
pathconcat /sbin after
pathconcat $HOME/.bin after
pathconcat $HOME/.local/bin after
pathconcat $HOME/.pyenv/bin after
pathconcat /usr/local/opt/gettext/bin after
pathconcat /usr/local/opt/sqlite/bin after
pathconcat /usr/local/opt/gnu-getopt/bin after
pathconcat /usr/local/go/bin after

pathconcat /apollo/env/SDETools/bin
pathconcat ~/.toolbox/bin

export PATH

eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
