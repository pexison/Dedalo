#!/bin/bash

# Install vim config
ln -sf ~/Dedalo/vim/vimrc ~/.vimrc
mkdir ~/.vim # Case of error?
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall! +qa

# Install zsh config
ln -sf ~/Dedalo/zsh/.oh-my-zsh ~/.oh-my-zsh
ln -sf ~/Dedalo/zsh/zshrc ~/.zshrc

