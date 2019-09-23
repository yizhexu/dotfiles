#!/usr/bin/env bash
# -*- mode: sh -*-

pathconcat /usr/local/sbin
pathconcat /usr/local/bin
pathconcat /sbin after
# pathconcat /usr/local/anaconda3/bin after
pathconcat $HOME/.bin after
pathconcat $HOME/.local/bin after
pathconcat $HOME/.pyenv/bin after
pathconcat /usr/local/opt/gettext/bin after
pathconcat /usr/local/opt/sqlite/bin after
pathconcat /usr/local/opt/gnu-getopt/bin after

export PATH

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
