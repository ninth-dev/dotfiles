# If you want to profile you zshrc startup
# zmodload zsh/zprof

# PATH

# XXX - reconsider using gnu coreutils
# PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# PATH="${PATH}:${HOME}/.bash-my-aws/bin"

# homebrew settings
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSECURE_REDIRECT=1

setopt extended_glob
setopt auto_cd
setopt autopushd
setopt pushdignoredups
setopt correct_all

# completion paths

HOMEBREW_PREFIX=$(brew --prefix)
[ -d "$HOMEBREW_PREFIX/share/zsh-completions" ] && fpath=("$HOMEBREW_PREFIX/share/zsh-completions" ${fpath[@]})
[ -d "$HOMEBREW_PREFIX/share/zsh/site-functions" ] && fpath=("$HOMEBREW_PREFIX/share/zsh/site-functions" ${fpath[@]})

## functions
export SRC_DEFAULT_SEARCH_PATH="${HOME}/Documents/src"

# set this to a different directory usage: src p
# export SRC_P_SEARCH_PATH="${HOME}/Documents/src"

[ -d "${HOME}/zshrc.d/functions" ] && fpath=("${HOME}/zshrc.d/functions" ${fpath[@]})

source "${HOME}/zshrc.d/function.zsh"
source "${HOME}/zshrc.d/aliases.zsh"
source "${HOME}/zshrc.d/completion.zsh"
source "${HOME}/zshrc.d/keybind.zsh"
source "${HOME}/zshrc.d/history.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zsh plugins
source "${HOME}/zshrc.d/plugins/git.zsh"
source "${HOME}/zshrc.d/plugins/git.plugin.zsh"
source "${HOME}/zshrc.d/plugins/fzf-git.sh"


# bash-my-aws
# source "${HOME}/.bash-my-aws/aliases"
# source "${HOME}/.bash-my-aws/bash_completion.sh"

# source any local setup if it exists
[ -s "${HOME}/.zshrc.local" ] && source "${HOME}/.zshrc.local"

## pure prompt
if [[ -d "${HOME}/zshrc.d/pure" ]]; then
  fpath+=("${HOME}/zshrc.d/pure")
  autoload -Uz promptinit && promptinit
  prompt pure
else
  ## XXX - maybe clone in the install script
  echo "Missing pure prompt, clone it at ${HOME}/zshrc.d/"
fi

## Rust
# source $HOME/.cargo/env

# >>> scala-cli completions >>>
fpath=("${HOME}/Library/Application Support/ScalaCli/completions/zsh" $fpath)
compinit
# <<< scala-cli completions <<<
