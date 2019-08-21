# shortcut to my src files
function src(){
  builtin cd "$(
    fd --max-depth=1 --type d . "$HOME/Documents/src" -exec basename {} \
      | sort --reverse \
      | sk --color=current_bg:24 \
      | xargs -I{} echo "$HOME/Documents/src/{}" \
    )" || exit
}
