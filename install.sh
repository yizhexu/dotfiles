#!/bin/sh

# Install packages
graphviz

# Install `stow`.
yay stow

stow bash
stow vim
stow emacs
stow git
stow screen

# Link .bash_profile -> .bashrc
rm -f ~/.bash_profile
ln -s ~/.bashrc ~/.bash_profile
