#!/bin/bash

mkdir ~/.dotfiles_backup
mv ~/.bash_profile ~/.bash_aliases ~/.bashrc ~/.gitconfig ~/.tmux.conf ~/.vim ~/.vimrc ~/.dotfiles_backup
ln -sf ~/.dotfiles/bash_profile ~/.bash_profile
ln -sf ~/.dotfiles/bash_aliases ~/.bash_aliases
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vimrc ~/.vimrc
