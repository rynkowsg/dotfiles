echo "~/.bashrc"

if [ -f ~/.my-config/home/common_rc ]; then
   source ~/.my-config/home/common_rc
fi

if [ -f ~/.aliases ]; then
   source ~/.aliases
fi


####
# Bash Completion for NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

