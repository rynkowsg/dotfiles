echo "dotfiles/home/.bashrc"

if [ -f ~/.dotfiles/home/common_rc ]; then
   source ~/.dotfiles/home/common_rc
fi

if [ -f ~/.aliases ]; then
   source ~/.aliases
fi
