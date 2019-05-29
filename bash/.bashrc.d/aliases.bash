# -*- mode: sh -*-
#alias gpg="gpg2"
alias less="less -R" # display colors correctly
#alias la="ls -la"
#alias ll="ls -l"
alias ln="ln -v"
#alias ls="ls --color -h"
alias mkdir="mkdir -p"
alias myip="ip address | grep inet.*wlan0 | cut -d' ' -f6 | sed \"s/\/24//g\""
alias speedtest='echo "scale=2; `curl  --progress-bar -w "%{speed_download}" http://speedtest.wdc01.softlayer.com/downloads/test10.zip -o /dev/null` / 131072" | bc | xargs -I {} echo {} mbps'
alias tree="tree -C" # add colors
alias ut="tar xavf"
alias vi="vim"

usage() {
  du -sch "$@" | sort -h
}
