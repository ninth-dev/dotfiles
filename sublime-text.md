# Sublime Text

### Symlink to `subl`

```sh
ln -sv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
```

### Sublime Keybindings

[Default (OSX).sublime-keymap](./SublimeText/latest/User/Default (OSX).sublime-keymap)

Notes:

- Disable macOS key binding ( System Preferences > Keyboard > Shortcuts > Spotlight > Uncheck Show Finder search window )
- Will replace Sublime default features if LSP works.

|                                            |                                |
| ------------------------------------------ | ------------------------------ |
| `⌃ Ctrl` + `-`                             | Jump Back                      |
| `⌃ Ctrl` + `⇧ Shift` + `-`                 | Jump Forward                   |
| `⌘ Command` + `⌥ Option` + `↓`             | Go to Definition               |
| `⌘ Command` + `⌥ Option` + `⇧ Shift` + `↓` | Find References                |
| `⌘ Command` + `⌥ Option` + `Space`         | Signature Help                 |
| `⌘ Command` + `⌘ Command`                  | Hover                          |
| `⌘ Command` + `⏎ Enter`                    | Code Actions                   |
| `⌘ Command` + `⇧ Shift` + `e`              | Toggle Between Source and Test |

|                                            |                                |
| ------------------------------------------ | ------------------------------ |
| `⌘ Command` + `b`                          | Build                          |
| `⌘ Command` + `⇧ Shift` + `b`              | Build Variants                 |
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

## To learn

- How to organise imports ( ScalaFmt ? )
- Remove unused imports
- Format Code
