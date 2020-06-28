# My dotfiles
My Daily use configuration for:
- zsh
- tmux
- vim

## Dependencies
### VIM
- vim-plug (https://github.com/junegunn/vim-plug)
### ZSH
- oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)

## Deploy
Run the script `deploy.sh` and follow the instructions. This will install all the basic
dependencies for tha daily work, change the default shell to zsh, link the dotfiles to home
and install the plugins for VIM.

I know that I always forget to `git clone --recursive`, so there is a fallback for that case ;)
