# Use Emacs style key bindings.
bindkey -e

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Bind shift-tab for moving completion list backward.
bindkey '^[[Z' reverse-menu-complete
