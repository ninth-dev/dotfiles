# Sublime Text

### Installation

[SublimeText settings](https://github.com/ninth-dev/SublimeText)

```sh
ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
```

### Sublime Keybindings

|                                            |                                |
| ------------------------------------------ | ------------------------------ |
| `⌘ Command` + `[`                          | Jump Back                      |
| `⌘ Command` + `]`                          | Jump Forward                   |
| `⌘ Command` + `⌥ Option` + `↓`             | Go to Definition               |
| `⌘ Command` + `⌥ Option` + `⇧ Shift` + `↓` | Find References                |
| `⌘ Command` + `⇧ Shift` + `H`              | Signature Help                 |
| `⌘ Command` + `⌘ Command`                  | Hover                          |
| `⌘ Command` + `⏎ Enter`                    | Code Actions                   |
| `⌘ Command` + `⇧ Shift` + `E`              | Toggle Between Source and Test |

|                                            |                                |
| ------------------------------------------ | ------------------------------ |
| `⌘ Command` + `B`                          | Build                          |
| `⌘ Command` + `⇧ Shift` + `B`              | Build Variants                 |
| `F4`                                       | Next Results                   |
| `⇧ Shift` + `F4`                           | Prev Results                   |

[Default (OSX).sublime-mousemap](./SublimeText/latest/User/Default (OSX).sublime-mousemap)

```json
[
  {
    "button": "button1",
    "count": 2,
    "modifiers": ["control"],
    "press_command": "drag_select",
    "command": "goto_definition"
  },
  {
    "button": "button1",
    "count": 1,
    "modifiers": ["control"],
    "press_command": "drag_select",
    "command": "lsp_symbol_definition"
  }
]
```
