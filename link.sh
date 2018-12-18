#!/bin/bash

DOTFILESREPO=~/Dedalo

############################################################################
# Symlink zsh config
############################################################################
ln -sf $DOTFILESREPO/zsh/oh-my-zsh ~/.oh-my-zsh
ln -sf $DOTFILESREPO/zsh/zshrc ~/.zshrc
ln -sf $DOTFILESREPO/zsh/zshtheme ~/.zshtheme
ln -sf $DOTFILESREPO/zsh/custom-themes ~/.zsh-custom-themes

############################################################################
# Symlink tmux config
############################################################################
ln -sf $DOTFILESREPO/tmux/tmux.conf ~/.tmux.conf
ln -sf $DOTFILESREPO/tmux/tmux.airline.conf ~/.tmux.airline.conf

############################################################################
# Symlink vim config
############################################################################
ln -sf $DOTFILESREPO/vim ~/.vim
