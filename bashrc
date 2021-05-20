echo "dotfiles/home/.bashrc"

### COMMONS

if [ -f ~/.dotfiles/home/common_rc ]; then
   source ~/.dotfiles/home/common_rc
fi

if [ -f ~/.aliases ]; then
   source ~/.aliases
fi

### SPECIFIC

# Enable fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Enable iTerm2 Shell Integration
[ -f ../mac/iterm2_shell_integration.bash ] && source ../mac/iterm2_shell_integration.bash
