#!/bin/bash

source $HOME/.dotfiles/bash_scripts/golang.sh

GOLANG_DOWNLOAD_URL=https://storage.googleapis.com/golang/go${GOLANG_VERSION}.linux-amd64.tar.gz

GOLANG_BASE=${HOME}/go

[[ ! -d $GOROOT ]] && {
    gotmp=$(mktemp -d)
    pushd $gotmp
        curl -O -L -J $GOLANG_DOWNLOAD_URL
        gzip -cd go${GOLANG_VERSION}.linux-amd64.tar.gz | tar xf -

        mkdir -p $GOLANG_BASE
        mv ./go ${GOLANG_BASE}/go_${GOLANG_VERSION}
    popd

    [[ -d $gotmp ]] && {
        rm -rf $gotmp
    }
}
