echo "~/.zshrc"

export PATH="/usr/local/bin:$PATH"

# to activate zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# load aliases
if [ -f ~/.aliases ]; then
   source ~/.aliases
fi

