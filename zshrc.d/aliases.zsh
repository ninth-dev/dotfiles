alias ls='ls --color=always'
alias ll='ls -lhrt'
alias amm='amm --no-remote-logging'

# nocorrect for certain commands
alias cp='nocorrect cp'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias sudo='nocorrect sudo'
alias fd='nocorrect fd'
alias rg='nocorrect rg'
alias sk='nocorrect sk'
alias git='nocorrect git'

# rust
alias cargo='nocorrect cargo'
alias cargo-test-no-warning='cargo test 2>/dev/null'

# sdk
alias sdk='nocorrect sdk'

# scala
alias bloop='nocorrect bloop'
alias sbt='nocorrect sbt'

# sublime text pkgs
alias subl-pkg='cd "${HOME}/Library/Application Support/Sublime Text/Packages/User"'

# helpers
alias uuid="uuidgen | tr '[:upper:]' '[:lower:]' | tee /dev/tty | tr -d '\n' | pbcopy"
