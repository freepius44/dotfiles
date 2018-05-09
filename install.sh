#!/bin/sh -e

# WARNING: Dont' forget to install git submodules!

DOTFILES=$(dirname $(readlink -f $0))

# Make links
LINKS=".global_gitignore .gitconfig .vimrc .fonts .vim"
for i in $LINKS; do
    ln -s $DOTFILES/$i ~/$i
done

# oh-my-git
fc-cache -fv ~/.fonts
echo "source $DOTFILES/oh-my-git/prompt.sh" >> ~/.bash_profile

# Vim
vim +:PluginUpdate +:qall

# SSH
mkdir -p ~/.ssh
cat $DOTFILES/id_rsa.pub >> ~/.ssh/authorized_keys