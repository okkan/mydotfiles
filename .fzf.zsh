# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/captain/.vim/bundle/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/captain/.vim/bundle/fzf/bin"
fi

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/captain/.vim/bundle/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/captain/.vim/bundle/fzf/shell/key-bindings.zsh"
