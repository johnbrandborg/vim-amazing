#!/bin/sh

if ! command -v curl &> /dev/null
then
    echo "Curl needs to be installed"
    exit 1
fi

if ! command -v git &> /dev/null
then
    echo "Git needs to be installed"
    exit 1
fi

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Power Level 10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install VIM Amazing configuration
git clone --depth=1 https://github.com/johnbrandborg/vim-amazing.git $HOME/.vim-amazing

# Symlink Configuration files
ln -s ~/.vimrc ~/.vim-amazing/.vimrc-coc
ln -s ~/.zshrc ~/.vim-amazing/zshrc
ln -s ~/.p10k.zsh ~/.vim-amazing/p10k.zsh
