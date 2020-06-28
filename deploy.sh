#!/bin/bash

read -p "Insert location of the repository if it differs from default [~/Dedalo]: " -s dotfilesrepo

if [ -z "$dotfilesrepo" ]; then
  dotfilesrepo=~/Dedalo
fi;

printf "\nInsert password (`whoami`): "
read -s uPassword

############################################################################
# Install most used dependencies
############################################################################
printf "%s\n" "$uPassword" |
sudo --stdin apt install zsh \
                 gcc \
                 clang \
                 perl \
                 make \
                 cmake \
                 vim \
                 tmux \
                 trash-cli \
                 silversearcher-ag \
                 fonts-powerline \
                 fonts-emojione \
                 fonts-noto-color-emoji

############################################################################
# Change system settings
############################################################################
sudo -S chsh -s $(which zsh) "$USER" <<< "$uPassword"

############################################################################
# Recursive clone backup
############################################################################
# Always forgetting to clone recursive
if [ -d $dotfilesrepo/zsh/oh-my-zsh/.git ]; then
  cd $dotfilesrepo/zsh/oh-my-zsh
  git submodule update --init --recursive
  cd $dotfilesrepo/zsh/custom-themes/powerlevel9k
  git submodule update --init --recursive
  cd -
fi;

############################################################################
# Symlink config
############################################################################
# Symlinks for zsh
ln -sf $dotfilesrepo/zsh/oh-my-zsh ~/.oh-my-zsh
ln -sf $dotfilesrepo/zsh/zshrc ~/.zshrc
ln -sf $dotfilesrepo/zsh/zshtheme ~/.zshtheme
ln -sf $dotfilesrepo/zsh/custom-themes ~/.zsh-custom-themes

# Symlinks for tmux
ln -sf $dotfilesrepo/tmux/tmux.conf ~/.tmux.conf
ln -sf $dotfilesrepo/tmux/tmux.airline.conf ~/.tmux.airline.conf

# Symlinks for vim
ln -sf $dotfilesrepo/vim ~/.vim

############################################################################
# Install vim plugins
############################################################################
vim -c ':PlugUpgrade | PlugInstall | exit | exit'
