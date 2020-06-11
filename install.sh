#!/bin/bash

HOME_DOTFILES="${HOME}/.dotfiles"

#[ -e "${HOME_DOTFILES}" ] && mv "${HOME_DOTFILE}" "${HOME_DOTFILES}_backup"
#ln -s `pwd` "${HOME_DOTFILES}"

#[ -f ~/.aliases ] && mv ~/.aliases ~/.aliases_backup
ln -s "${HOME_DOTFILES}/home/.aliases" ~/.aliases

[ -f ~/.oh-my-zsh ] && mv ~/.oh-my-zsh ~/.oh-my-zsh_backup
ln -s "${HOME_DOTFILES}/home/.oh-my-zsh" ~/.oh-my-zsh

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
#[ -f ~/.vim ] && mv ~/.vim ~/.vim_backup
ln -s "${HOME_DOTFILES}/home/.vim" ~/.vim

#[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc_backup
ln -s "${HOME_DOTFILES}/home/.zshrc" ~/.zshrc

#[ -f ~/.oh-my-zsh ] && mv ~/.oh-my-zsh ~/.oh-my-zsh_backup
ln -s "${HOME_DOTFILES}/refs/oh-my-zsh" ~/.oh-my-zsh

[ -f ~/.nvm ] && mv ~/.nvm ~/.nvm_backup
ln -s "${HOME_DOTFILES}/home/.nvm" ~/.nvm

[ -f ~/.pyenv ] && mv ~/.pyenv ~/.pyenv_backup
ln -s "${HOME_DOTFILES}/home/.pyenv" ~/.pyenv

[ -f ~/.rbenv ] && mv ~/.rbenv ~/.rbenv_backup
ln -s "${HOME_DOTFILES}/home/.rbenv" ~/.rbenv

[ -f ~/.jenv ] && mv ~/.jenv ~/.jenv_backup
ln -s "${HOME_DOTFILES}/home/.jenv" ~/.jenv

ln -s "${HOME_DOTFILES}/refs/pyenv-virtualenv" "home/.pyenv/plugins/pyenv-virtualenv"

ln -s "/Users/greg/.dotfiles/home/.fzf" ~/.fzf
ln -s "/Users/greg/.dotfiles/home/.fzf.bash" ~/.fzf.bash
ln -s "/Users/greg/.dotfiles/home/.fzf.zsh" ~/.fzf.zsh

[ -f ~/.clojure ] && mv ~/.clojure/ ~/.clojure_backup
mkdir ~/.clojure
ln -s "${HOME_DOTFILES}/home/.clojure/deps.edn" ~/.clojure/deps.edn
