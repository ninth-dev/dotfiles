# vi mode 
export TERM=alacritty

bindkey -v
export KEYTIMEOUT=1

# aliases
[ -f ~/.aliases ] && source ~/.aliases

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

# history
export HISTSIZE=500000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

setopt histreduceblanks histignorespace histignorealldups hist_verify inc_append_history

# auto-complete
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# bash-my-aws 
# for f in ~/.bash-my-aws/lib/*-functions; do source "$f"; done
# source ~/.bash-my-aws/bash_completion.sh

# zr - plugin manager
if [[ ! -f ~/.zr/init.zsh ]] || [[ ~/.zshrc -nt ~/.zr/init.zsh ]]; then
  zr load \
    robbyrussell/oh-my-zsh/lib/git.zsh \
    robbyrussell/oh-my-zsh/plugins/git/git.plugin.zsh \
    robbyrussell/oh-my-zsh/lib/completion.zsh \
    zsh-users/zsh-autosuggestions \
    mafredri/zsh-async/async.zsh \
    sindresorhus/pure
fi

[ -f ~/.zr/init.zsh ] && source ~/.zr/init.zsh
