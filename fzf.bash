#######################################################################
# These are files geberated by /usr/local/opt/fzf/install.            #
# I replaced /usr/local/opt/fzf by $FZF_ROOT to be platform agnostic. #
# FZF_ROOT is set in platformrc.                                      #
# #####################################################################

# Setup fzf
# ---------
if [[ ! "$PATH" == *${FZF_ROOT}/bin* ]]; then
  export PATH="${PATH:+${PATH}:}${FZF_ROOT}/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${FZF_ROOT}/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "${FZF_ROOT}/shell/key-bindings.bash"
