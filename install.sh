#!/bin/bash

HOME_DOTFILES="${HOME}/.dotfiles"

#[ -e "${HOME_DOTFILES}" ] && mv "${HOME_DOTFILE}" "${HOME_DOTFILES}_backup"
#ln -s `pwd` "${HOME_DOTFILES}"

#[ -f ~/.aliases ] && mv ~/.aliases ~/.aliases_backup
ln -s "${HOME_DOTFILES}/home/.aliases" ~/.aliases

#[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc_backup
ln -s "${HOME_DOTFILES}/home/.bashrc" ~/.bashrc

#[ -f ~/.bash_profile ] && mv ~/.bash_profile ~/.bash_profile_backup
ln -s "${HOME_DOTFILES}/home/.bash_profile" ~/.bash_profile

#[ -f ~/.gitconfig ] && mv ~/.gitconfig ~/.gitconfig_backup
ln -s "${HOME_DOTFILES}/home/.gitconfig" ~/.gitconfig

#[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf_backup
ln -s "${HOME_DOTFILES}/home/.tmux.conf" ~/.tmux.conf

#[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc_backup
ln -s "${HOME_DOTFILES}/home/.vimrc" ~/.vimrc

#[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc_backup
ln -s "${HOME_DOTFILES}/home/.zshrc" ~/.zshrc

#[ -f ~/.oh-my-zsh ] && mv ~/.oh-my-zsh ~/.oh-my-zsh_backup
ln -s "${HOME_DOTFILES}/refs/oh-my-zsh" ~/.oh-my-zsh
