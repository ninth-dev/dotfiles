# aliases
[ -f ~/.aliases ] && source ~/.aliases

# zsh options
setopt autocd
setopt autopushd pushdignoredups

# history
export HISTSIZE=500000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

setopt histreduceblanks histignorespace histignorealldups

# auto-complete
autoload -U compinit compdef && compinit
autoload -U bashcompinit && bashcompinit

# bash-my-aws
for f in ~/.bash-my-aws/lib/*-functions; do source "$f"; done
source ~/.bash-my-aws/bash_completion.sh

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
