pathconcat () {
  if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
    if [ "$2" = "after" ] ; then
      PATH=$PATH:$1
    else
      PATH=$1:$PATH
    fi
  fi
}

pathconcat /usr/local/sbin
pathconcat /usr/local/bin
pathconcat /sbin after
pathconcat $HOME/bin after
pathconcat $HOME/.bin after
pathconcat $HOME/.local/bin after
pathconcat $GOPATH/bin after

export PATH
