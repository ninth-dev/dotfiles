# If you want to profile you zshrc startup
# zmodload zsh/zprof

# PATH

# XXX - reconsider using gnu coreutils
# PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# PATH="${PATH}:${HOME}/.bash-my-aws/bin"

# homebrew settings
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
# export HOMEBREW_CASK_OPTS=--require-sha

setopt extended_glob
setopt auto_cd
setopt autopushd
setopt pushdignoredups
setopt correct_all

# completion paths
[ -d "/usr/local/share/zsh-completions" ] && fpath=(/usr/local/share/zsh-completions ${fpath[@]})

## functions
[ -d "${HOME}/zshrc.d/functions" ] && fpath=("${HOME}/zshrc.d/functions" ${fpath[@]})

source "${HOME}/zshrc.d/function.zsh"
source "${HOME}/zshrc.d/aliases.zsh"
source "${HOME}/zshrc.d/completion.zsh"
source "${HOME}/zshrc.d/keybind.zsh"
source "${HOME}/zshrc.d/history.zsh"

# zsh plugins
source "${HOME}/zshrc.d/plugins/git.plugin.zsh"
source "${HOME}/zshrc.d/plugins/skim.plugin.zsh"

# nvm
# note: NVM is autoloaded in functions.zsh
NVM_DIR="$HOME/.nvm"
NVM_PATH="/usr/local/opt/nvm/" # brew --prefix nvm
[ -s "${NVM_PATH}/etc/bash_completion.d/nvm" ] && source "${NVM_PATH}/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# bash-my-aws
source "${HOME}/.bash-my-aws/aliases"
source "${HOME}/.bash-my-aws/bash_completion.sh"

# source any local setup if it exists
[ -s "${HOME}/.zshrc.local" ] && source "${HOME}/.zshrc.local"

## pure prompt
[ -d "${HOME}/zshrc.d/pure" ] && fpath+=("${HOME}/zshrc.d/pure")
autoload -Uz promptinit && promptinit
prompt pure

## zprof
