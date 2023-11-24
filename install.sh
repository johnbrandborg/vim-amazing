#!/bin/bash

command_exists() {
  command -v "$@" >/dev/null 2>&1
}

command_exists curl || {
    echo "Curl needs to be installed"; exit 1
}

command_exists git || {
    echo "Git needs to be installed"; exit 1
}

# Install Oh My Zsh
if [ ! -d ~/.oh-my-zsh ]; then
    echo "Oh My Zshell is not installed. Please install using the command below and run again:"
    echo 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
    exit 1
fi

# Install Power Level 10k
if [ ! -d  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]; then
    git clone --depth=1 \
        https://github.com/romkatv/powerlevel10k.git$ \
        {ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Install VIM Amazing configuration
if [ ! -d $HOME/.vim-amazing ]; then
    git clone --depth=1 \
        https://github.com/johnbrandborg/vim-amazing.git \
        $HOME/.vim-amazing
fi

# Symlink Configuration files
ln -s ~/.vim-amazing/zshrc ~/.zshrc
ln -s ~/.vim-amazing/p10k.zsh ~/.p10k.zsh

echo -e "\nVIM Autocompletion Setup"
PS3="Please enter your choice: "
options=("Conquer of Completion" "You Complete Me" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Conquer of Completion")
            echo "Conquer of Completion will be used"
            ln -s ~/.vim-amazing/vimrc-coc ~/.vimrc
            break
            ;;
        "You Completion Me")
            echo "You Complete Me will be used"
            ln -s ~/.vim-amazing/vimrc-ycm ~/.vimrc
            break
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done
