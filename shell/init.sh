#!/bin/bash
dirname=$(dirname "$0")
cd $dirname
cp -iv linux/bashrc ~/.bashrc
cp -iv linux/profile ~/.profile
cp -iv gitconfig ~/.gitconfig
cp -iv gitignore ~/.gitignore
cp -iv screenrc ~/.screenrc
cp -iv tmux.conf ~/.tmux.conf
cp -iv vimrc ~/.vimrc
if [ ! -d `realpath ~/.vim` ]; then
    cp -r -iv vim ~/.vim
fi
if [ ! -d `realpath ~/vi_backup` ]; then
    mkdir ~/vi_backup # for .vimrc backupdir=~/vi_backup/
fi
