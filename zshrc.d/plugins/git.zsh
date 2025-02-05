function __git_prompt_git() {
  GIT_OPTIONAL_LOCKS=0 command git "$@"
}

function git_current_branch() {
  local ref
  ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

function git_previous_branch() {
  local previous_branch
  previous_branch=$(__git_prompt_git reflog 2> /dev/null | rg ".*checkout: moving from (.*) to $(git_current_branch)" -r '$1' -m 1)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
  fi
  echo $previous_branch
}

function glrb() {
  if [[ "$#" != 0 ]]; then
    command git switch "${*}"
    ggl
    command git switch "$(git_previous_branch)"
    command git rebase "${*}"
  else
    return
  fi
}

alias glrbm='glrb $(git_main_branch)'
alias gsw!='git switch $(git_previous_branch)'
alias glom='git log --oneline --decorate --max-count=10'

