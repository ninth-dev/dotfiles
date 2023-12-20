# If you want to profile you zshrc startup
# zmodload zsh/zprof

# PATH

# XXX - reconsider using gnu coreutils
# PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
# PATH="${PATH}:${HOME}/.bash-my-aws/bin"

# homebrew settings
export HOMEBREW_NO_ANALYTICS=1
# export HOMEBREW_NO_GITHUB_API=1
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

# docker autocomplete
# > docker_loc=$(which docker)
# > dirname $(dirname ${docker_loc:A}) # copy the path

# > ln -s "/Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion" "/usr/local/share/zsh/site-functions/_docker"
# > ln -s "/Applications/Docker.app/Contents/Resources/etc/docker-machine.zsh-completion" "/usr/local/share/zsh/site-functions/_docker-machine"
# > ln -s "/Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion" "/usr/local/share/zsh/site-functions/_docker-compose"

## functions
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

# nvm
# note: NVM is autoloaded in functions.zsh
NVM_DIR="$HOME/.nvm"
NVM_PATH="/usr/local/opt/nvm/" # brew --prefix nvm
[ -s "${NVM_PATH}/etc/bash_completion.d/nvm" ] && source "${NVM_PATH}/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


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
source $HOME/.cargo/env

# >>> scala-cli completions >>>
fpath=("${HOME}/Library/Application Support/ScalaCli/completions/zsh" $fpath)
compinit
# <<< scala-cli completions <<<



