#!/bin/bash

# TODO: Add parser support
FROMSCRATCH=$1

DOTFILESREPO=~/Dedalo
VIMDIR=~/.vim

############################################################################
# Install vim config
############################################################################

ln -sf $DOTFILESREPO/vim/vimrc ~/.vimrc

if [ ! -d $VIMDIR ] && [ ! -L $VIMDIR ]; then
  mkdir $VIMDIR
fi

if [ ! -z $FROMSCRATCH ]; then
  # This curl will fall down to the repo following the symlink
  curl -fLo $VIMDIR/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall! +qa
else
  ln -sf $DOTFILESREPO/vim/autoload $VIMDIR/autoload
  ln -sf $DOTFILESREPO/vim/plugged $VIMDIR/plugged
fi

############################################################################
# Install zsh config
############################################################################
ln -sf $DOTFILESREPO/zsh/.oh-my-zsh ~/.oh-my-zsh
ln -sf $DOTFILESREPO/zsh/zshrc ~/.zshrc

