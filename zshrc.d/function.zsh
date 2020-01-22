# shortcut to my src files
function src(){
  local filter="$*"
  builtin cd "$(
    fd --max-depth=1 --hidden --type d . "$HOME/Documents/src" -exec basename {} \
      | rg "${filter}" \
      | (echo "." && cat) \
      | sort --reverse \
      | sk \
      | xargs -I{} echo "$HOME/Documents/src/{}" \
    )" || return
}
