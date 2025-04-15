# Ruby

## Use mise as the version manager for ruby

https://github.com/jdx/mise

## Setup startup files

```
echo 'eval "$(mise activate zsh --shims)"' >> ~/.zprofile # this sets up non-interactive sessions
echo 'eval "$(mise activate zsh)"' >> ~/.zshrc    # this sets up interactive sessions
```

Note: using the shims will help set up the ruby verison for each project when not using the terminal.

## SublimeText plugins

- [ruby-lsp](https://lsp.sublimetext.io/language_servers/#ruby-lsp)
- [SublimeLinter-ruby](https://github.com/SublimeLinter/SublimeLinter-ruby)

- ??? Consider [SublimeLinter-rubocop](https://github.com/SublimeLinter/SublimeLinter-rubocop)

