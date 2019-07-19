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

# path
source ~/.bashrc.d/path.bash

# aliases
source ~/.bashrc.d/aliases.bash

# secret bash
source ~/.bashrc.d/secret.bash
