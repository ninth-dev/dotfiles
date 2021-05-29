# Sublime Text

### Symlink to `subl`

```sh
ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
```

### Sublime Keybindings

[Default (OSX).sublime-keymap](./SublimeText/latest/User/Default (OSX).sublime-keymap)

Command (or Cmd) ⌘
Shift ⇧
Option (or Alt) ⌥
Control (or Ctrl) ⌃
Caps Lock ⇪
Fn

|                                            |                                |
| ------------------------------------------ | ------------------------------ |
| `⌃ Ctrl` + `-`                             | Jump Back                      |
| `⌃ Ctrl` + `⇧ Shift` + `-`                 | Jump Forward                   |
| `⌘ Command` + `⌥ Option` + `↓`             | Go to Definition               |
| `⌘ Command` + `⌥ Option` + `⇧ Shift` + `↓` | Go to Reference                |
| `⌘ Command` + `⇧ Shift` + `h`              | Signature Help                 |
| `⌘ Command` + `⇧ Shift` + `m`              | Hover                          |
| `⌘ Command` + `⏎ Enter`                    | Code Actions                   |
| `⌘ Command` + `⇧ Shift` + `e`              | Toggle Between Source and Test |

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

## To learn

- How to organise imports
- Remove unused Imports
