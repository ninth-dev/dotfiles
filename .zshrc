# PATH
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="${PATH}:${HOME}/.bash-my-aws/bin"
export PATH

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

# completion paths
[ -d "/usr/local/share/zsh-completions" ] && fpath=(/usr/local/share/zsh-completions $fpath)

source "${HOME}/zshrc.d/aliases.zsh"
source "${HOME}/zshrc.d/completion.zsh"
source "${HOME}/zshrc.d/function.zsh"
source "${HOME}/zshrc.d/keybind.zsh"
source "${HOME}/zshrc.d/history.zsh"

# zsh plugins
source "${HOME}/zshrc.d/plugins/git.plugin.zsh"
source "${HOME}/zshrc.d/plugins/skim.plugin.zsh"
source "${HOME}/zshrc.d/plugins/zsh-you-should-use/you-should-use.plugin.zsh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# bash-my-aws
source "${HOME}/.bash-my-aws/aliases"
source "${HOME}/.bash-my-aws/bash_completion.sh"

# source any local setup if it exists
[ -s "${HOME}/.zshrc.local" ] && source "${HOME}/.zshrc.local"

# setup pure prompt
autoload -U promptinit && promptinit
prompt pure

