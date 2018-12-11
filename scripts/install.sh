#!/bin/bash

#Todo determine which vim is installed
# Using vim
cp -rf  vim/vimrc ~/.vimrc
mkdir ~/.vim # Case of error?
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall! +qa
#ln -sf ~/Dedalo/vim/.vimrc ~/.vim/vimrc

