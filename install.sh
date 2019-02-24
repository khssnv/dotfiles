#!/bin/sh

cp -rf ./.zshrc ~
cp -rf ./.zlogin ~
cp -rf ./.zlogout ~
cp -rf ./.vimrc ~
cp -rf ./.gitconfig ~
cp -rf ./.tmux.conf ~

# VIM Vundle
if [ ! -e ~/.vim/bundle/Vundle.vim ];
then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
fi
