#!/usr/bin/env bash
# -*- mode: sh -*-
# Bash
export SHELL=/bin/bash

# Prompt for the legends
PS1='\[\e[0;36m\]ϟϟϟ \[\e[0;32m\]\w ⟶ \[\e[0;37m\]'

# Erase duplicates in history
export HISTCONTROL=erasedups

# Store 10k history entries
export HISTSIZE=10000

# Append to the history file when exiting instead of overwriting it
shopt -s histappend

# Define functions
pathconcat () {
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    if [ "$2" = "after" ] ; then
      PATH=$PATH:$1
    else
      PATH=$1:$PATH
    fi
  fi
}

# path, alias, and other configs
source "${HOME}"/.bashrc.d/*
