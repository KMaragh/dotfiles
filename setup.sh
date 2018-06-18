#!/bin/bash

echo "Making backup directory"
mkdir ~/.dotfiles_backup

echo "Moving current dotfiles to backup directory"
mv ~/.bash_profile ~/.bash_aliases ~/.bashrc ~/.gitconfig ~/.tmux.conf ~/.vim ~/.vimrc ~/.bash_scripts ~/.dotfiles_backup

echo "Symlinking dotfiles directory."
ln -sf ~/.dotfiles/bash_profile ~/.bash_profile
ln -sf ~/.dotfiles/bash_aliases ~/.bash_aliases
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/bash_scripts ~/.bash_scripts

echo "Sourcing extra bash scripts"
source ~/.bash_scripts/
