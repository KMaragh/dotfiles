case "$-" in
    *i*) INTERACTIVE=yes ;;
    *)   unset INTERACTIVE ;;
esac

case "$0" in
    -*) LOGIN=yes ;;
    *)  unset LOGIN ;;
esac

[[ -r /etc/bashrc && -f /etc/bashrc ]] && source /etc/bashrc

umask 022

#source $HOME/.dotfiles/common.sh

[[ -e "/usr/share/terminfo/s/screen-256color" ]] &&
    TERM=screen-256color ||
    TERM=xterm-color
export TERM

: ${LANG:="en_US.UTF-8"}
: ${LANGUAGE:="en"}
: ${LC_ALL:="en_US.UTF-8"}
: ${LC_CTYPE:="en_US.UTF-8"}
export LANG LANGUAGE LC_ALL LC_CTYPE

HISTCONTROL=erasedups
HISTFILESIZE=100000
HISTSIZE=100000
HISTIGNORE='$:exit'
shopt -s histappend

HAVE_VIM=$(command -v vim)
[[ -n $HAVE_VIM ]] &&
    EDITOR=vim ||
    EDITOR=vi
export EDITOR

dircolors="$(type -P gdircolors dircolors | head -1)"
[[ -n $dircolors ]] && {
    COLORS=/etc/DIR_COLORS
    test -e "/etc/DIR_COLORS.$TERM" && COLORS="/etc/DIR_COLORS.$TERM"
    test -e "$HOME/.dircolors" && COLORS="$HOME/.dircolors"
    test ! -e "$COLORS" && COLORS=
    eval `$dircolors --sh $COLORS`
}
unset dircolors

# set the directory color to a better blue
export LS_COLORS=$(echo $LS_COLORS | sed "s/di=\(..\);../di=\1;94/")

# prompt
BLUE="\[\033[0;34m\]"
BBLUE="\[\033[1;34m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
LGREEN="\[\033[01;32m\]"
PURPLE="\[\033[0;35m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
WHITE="\[\033[0;37m\]"
NONE="\[\033[0m\]"
PS1="\n${BBLUE}[\${?}]${LGREEN}\u${BBLUE}@${LGREEN}\h${BBLUE}:\w\n\$ ${WHITE}"
PS2="--> "
export PS1 PS2


# load local stuff
if [[ -d $HOME/.bin ]]; then
    path_prepend $HOME/.dotfiles/bin
fi

# ssh agent
SSH_AUTH_SOCK=/tmp/${USER}/ssh-agent.sock
SSH_AUTH_SOCK_DIR=$(dirname ${SSH_AUTH_SOCK})
[[ -d ${SSH_AUTH_SOCK_DIR} ]] || mkdir -m0700 ${SSH_AUTH_SOCK_DIR}
[[ -S ${SSH_AUTH_SOCK} ]] || eval $(ssh-agent -a "${SSH_AUTH_SOCK}" -t 8h)
export SSH_AUTH_SOCK

# Golang setup
source $HOME/.bash_scripts/golang.sh

#Git autocomplete
source $HOME/.bash_scripts/git-completion.bash

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
