#!/bin/bash
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$__dir" && cd .. || exit

curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh --output zshrc.d/plugins/git.plugin.zsh
curl https://raw.githubusercontent.com/ninth-dev/fzf-git.sh/main/fzf-git.sh --output zshrc.d/plugins/fzf-git.sh

