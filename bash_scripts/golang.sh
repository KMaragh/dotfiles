#!/bin/bash

source $HOME/.dotfiles/common.sh

# Go variables
GOLANG_VERSION=1.10.1
export GOLANG_VERSION

GOLANG_BASE=${HOME}/go
export GOROOT=${GOLANG_BASE}/go_${GOLANG_VERSION}
export GOPATH=${GOLANG_BASE}/gopath

[[ ! -d $GOPATH/bin ]] && {
    mkdir -p $GOPATH/bin
}

path_prepend $GOROOT/bin
path_prepend $GOPATH/bin
