echo "dotfiles/home/.bashrc"

if [ -f ~/.dotfiles/home/common_rc ]; then
   source ~/.dotfiles/home/common_rc
fi

if [ -f ~/.aliases ]; then
   source ~/.aliases
fi


####
# Bash Completion for NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

