# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.dotfiles/refs/fzf/bin* ]]; then
  export PATH="$PATH:$HOME/.dotfiles/refs/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.dotfiles/refs/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.dotfiles/refs/fzf/shell/key-bindings.bash"

