echo "~/.bashrc"

export PATH="/usr/local/bin:$PATH"

if [ -f ~/.aliases ]; then
   source ~/.aliases
fi

