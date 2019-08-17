export TERM=alacritty

# PATH
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# homebrew settings
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

setopt extended_glob
setopt auto_cd
setopt autopushd
setopt pushdignoredups
setopt correct_all

autoload colors && colors

source "${HOME}/zshrc.d/aliases.zsh"
source "${HOME}/zshrc.d/completion.zsh"
source "${HOME}/zshrc.d/keybind.zsh"
source "${HOME}/zshrc.d/history.zsh"

# zsh plugins
source "${HOME}/zshrc.d/plugins/git.plugin.zsh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# bash-my-aws
export PATH="${PATH}:${HOME}/.bash-my-aws/bin"
source $HOME/.bash-my-aws/aliases
source $HOME/.bash-my-aws/bash_completion.sh

# setup pure prompt
autoload -U promptinit && promptinit
prompt pure

