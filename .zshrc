export TERM=alacritty
bindkey -e

# key-binding
export EDITOR=vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey ' ' magic-space
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# homebrew settings
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_GITHUB_API=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# zsh options
setopt autocd
setopt autopushd pushdignoredups
setopt correct_all

# nocorrect for certain commands
alias cp='nocorrect cp'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias sudo='nocorrect sudo'
alias rg='nocorrect rg'
alias sk='nocorrect sk'

# history
export HISTSIZE=500000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

setopt histreduceblanks histignorespace histignorealldups hist_verify inc_append_history

# better history when you press up or down
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# aliases
[ -f "${HOME}/.aliases" ] && source "${HOME}/.aliases"


# auto-complete
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

# zsh plugins
[ -f "${HOME}/.git.plugin.zsh" ] && source "${HOME}/.git.plugin.zsh"
[ -f "${HOME}/.completion.plugin.zsh" ] && source "${HOME}/.completion.plugin.zsh"

# bash-my-aws
source $HOME/.bash-my-aws/aliases
source $HOME/.bash-my-aws/bash_completion.sh

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && source "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

# setup pure prompt
autoload -U promptinit && promptinit
prompt pure
