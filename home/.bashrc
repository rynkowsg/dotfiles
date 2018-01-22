echo "~/.bashrc"

if [ -f ~/.my-config/home/common_rc ]; then
   source ~/.my-config/home/common_rc
fi

if [ -f ~/.aliases ]; then
   source ~/.aliases
fi

