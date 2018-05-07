#!/bin/bash

# parameter substitution
# ${var-default} ${var:-default} - use default value : will use even if var declared but null
# ${var=default} ${var:=default} - set default value : will set even if var declared but null
# ${var+alt} ${var:+alt}         - use alt value if var set, otherwise null string : use alt value even if var declared but null otherwise null string

path_append() {
    [[ -n "$1" ]] && \
    [[ -d "$1" ]] && \
    [[ ":$PATH:" != *":$1:"* ]] && \
    PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
    [[ -n "$1" ]] && \
    [[ -d "$1" ]] && \
    [[ ":$PATH:$" != *":$1:"* ]] && \
    PATH="$1${PATH:+":$PATH"}"
}
