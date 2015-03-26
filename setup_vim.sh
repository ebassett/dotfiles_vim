#!/bin/sh

# EJB 2013-10-20
# Script stolen and modified from https://github.com/kevinSuttle/dotfiles/blob/master/setup-vim.zsh
# It turned out to be too much of a pain to deal with vundle as a submodule;
# and including the vundle files themselves but not vundle's own .git directory turned out ugly too;
# running this script to set up vundle and invoke it to install my other modules, after cloning my repo
# turned out to be the easiest.

cd $HOME/.vim
mkdir -p $HOME/.vim/_backup
mkdir -p $HOME/.vim/_tmp
mkdir -p $HOME/.vim/_undo

mkdir -p $HOME/.vim/bundle/vundle
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

ln -sf $HOME/.vim/vimrc $HOME/.vimrc

vim +PluginInstall

