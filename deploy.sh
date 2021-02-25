#!/bin/bash

read -p "Insert location of the repository if it differs from default [~/Dedalo]: " -s dotfilesrepo
if [ -z "$dotfilesrepo" ]; then
  dotfilesrepo=~/Dedalo
fi;

printf "\nInsert password (`whoami`): "
read -s uPassword
echo ""

# Recursive clone backup - always forgetting to clone recursive
if [ -d $dotfilesrepo/zsh/oh-my-zsh/.git ]; then
  cd $dotfilesrepo && git submodule update --init --recursive && cd -
fi

# Determine if the script is running under a Darwin distribution (mac in my case)
echo "Installing dependencies"
if [[ ! $(uname -a | grep 'Darwin') ]]; then
  printf "%s\n" "$uPassword" | sudo --stdin apt install zsh \
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
else
  echo "Installing Homebrew, please extend the deployment script with the next steps"
  #bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install ag rsnapshot htop tmux thefuck trash-cli
fi

echo "Changing default shell"
sudo -S chsh -s $(which zsh) "$USER" <<< "$uPassword"
echo ""

echo "Creating symlinks"
ln -sf $dotfilesrepo/zsh/oh-my-zsh ~/.oh-my-zsh
ln -sf $dotfilesrepo/zsh/zshrc ~/.zshrc
ln -sf $dotfilesrepo/zsh/zshtheme ~/.zshtheme
ln -sf $dotfilesrepo/zsh/custom-themes ~/.zsh-custom-themes
ln -sf $dotfilesrepo/tmux/tmux.conf ~/.tmux.conf
ln -sf $dotfilesrepo/tmux/tmux.airline.conf ~/.tmux.airline.conf
ln -sf $dotfilesrepo/vim ~/.vim

echo "Installing vim plugings"
vim -c ':PlugUpgrade | PlugInstall | exit | exit'

echo "Done!"
