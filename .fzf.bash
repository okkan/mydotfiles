# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/captain/.vim/bundle/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/captain/.vim/bundle/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/captain/.vim/bundle/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/captain/.vim/bundle/fzf/shell/key-bindings.bash"
