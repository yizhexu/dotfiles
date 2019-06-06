# -*- mode: sh -*-

# List direcory conqtents
alias ls='ls -G'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# Color output
alias grep='grep --color=auto'
alias tree="tree -C"
alias less="less -R" # display colors correctly

# Internet
alias ip="ip address | grep inet.*wlan0 | cut -d' ' -f6 | sed \"s/\/24//g\""
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias speedtest='echo "scale=2; `curl  --progress-bar -w "%{speed_download}" http://speedtest.wdc01.softlayer.com/downloads/test10.zip -o /dev/null` / 131072" | bc | xargs -I {} echo {} mbps'
alias whois="whois -h whois-servers.net"
alias p8="ping 8.8.8.8"
alias pg="ping google.de"

# macos
alias update='brew update && brew upgrade; brew cleanup'
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# wifi password
alias wifipass="security find-generic-password -g -D \"AirPort network password\" -w -a"
alias wifipow="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s"

usage() {
  du -sch "$@" | sort -h
}
