# shortcut to my src files
function src(){
  builtin cd "$(
    fd --max-depth=1 --hidden --type d . "$HOME/Documents/src" -exec basename {} \
      | (echo "." && cat) \
      | sort --reverse \
      | sk \
      | xargs -I{} echo "$HOME/Documents/src/{}" \
    )"
}
