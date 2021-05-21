# Scala

Instructions on how I like to setup my local environment for Scala.

## Getting started

Ensure Java 8 JDK (or Java 11 JDK) installed. We use AdoptOpenJDK 8/11.

### [sdkman](https://sdkman.io/usage) to install java

1. install [sdk man](https://sdkman.io/install)
   ```sh
   ## to determine if sdk has been installed.
   sdk version
   ```

1. install java
   ```sh
   ## to see list of java versions
   sdk list java
   ## install jdk8 and jdk11
   sdk install java 8.0.282.hs-adpt && sdk install java 11.0.10.hs-adpt
   ```

1. install scala
   ```sh
   ## to see list of scala versions
   sdk list scala
   ## install scala 3.0.0
   sdk install scala 3.0.0
   ```

### [sbt](https://www.scala-sbt.org/)

1. install sbt
   ```sh
   sdk install sbt
   ### to check if sbt is installed
   sbt exit
   ```

### [bloop](https://scalacenter.github.io/bloop/)

1. install bloop
   ```sh
   brew install scalacenter/bloop/bloop

   ### to check if bloop is installed
   bloop about
   ```

1. add bloop settings
   ```sh
   mkdir -p $HOME/.bloop
   {
    echo "{"
    echo '  "javaHome": "/Users/justin.lam/.sdkman/candidates/java/current",'
    echo '  "javaOptions": ["-XX:+UseParallelGC"]'
    echo "}"
   } > $HOME/.bloop/bloop.json
   ```

### [Ammonite-REPL](https://ammonite.io/#Ammonite-REPL)

1. install amm

   ```sh
   ## install a scala repl - ammonite-repl
   ## alternatively use [Scastie](https://scastie.scala-lang.org/)
   brew install ammonite-repl
   ```

### Setting up Sublime Text

1. install `LSP` package
1. install `LSP-metals` package
1. install `Scoggle` package

#### Sublime Keybindings

<details>
  <summary>Default (OSX).sublime-keymap</summary>

  ```json
  [
    {
      "command": "jump_back",
      "keys": ["primary+["]
    },
    {
      "command": "jump_forward",
      "keys": ["primary+]"]
    },
    //  Go To Definition
    { "keys": ["primary+shift+o"], "command": "goto_definition" },
    {
      "command": "lsp_symbol_definition",
      "args": {
        "side_by_side": false
      },
      "keys": ["primary+shift+o"],
      "context": [
        {
          "key": "lsp.session_with_capability",
          "operator": "equal",
          "operand": "definitionProvider"
        },
        {
          "key": "auto_complete_visible",
          "operator": "equal",
          "operand": false
        }
      ]
    },
    {
      "command": "lsp_hover",
      "keys": ["primary+shift+m"],
      "context": [
        {
          "key": "lsp.session_with_capability",
          "operator": "equal",
          "operand": "hoverProvider"
        }
      ]
    },
    {
      "command": "noop",
      "keys": ["primary+shift+h"],
      "context": [
        {
          "key": "lsp.signature_help",
          "operator": "equal",
          "operand": 0
        }
      ]
    },
    {
      "command": "lsp_code_actions",
      "keys": ["primary+shift+enter"],
      "context": [
        {
          "key": "lsp.session_with_capability",
          "operator": "equal",
          "operand": "hoverProvider"
        }
      ]
    },
    {
      "keys": ["enter"],
      "command": "commit_completion",
      "context": [{ "key": "auto_complete_visible" }]
    },
    {
      "keys": ["tab"],
      "command": "commit_completion",
      "context": [{ "key": "auto_complete_visible" }]
    }
  ]
  ```

</details>

|                     |                                |
| ------------------- | ------------------------------ |
| `⌘` + `[`           | Jump Back                      |
| `⌘` + `]`           | Jump Forward                   |
| `⌘` + `⇧` + `o`     | Go to Definition               |
| `⌘` + `⇧` + `h`     | Signature Help                 |
| `⌘` + `⇧` + `m`     | Hover                          |
| `⌘` + `⇧` + `enter` | Code Actions                   |
| `⌘` + `⇧` + `e`     | Toggle Between Source and Test |

<details>
  <summary>Default (OSX).sublime-mousemap</summary>

  ```json
  [
    {
      "button": "button1",
      "count": 2,
      "modifiers": ["super", "shift"],
      "press_command": "drag_select",
      "command": "goto_definition"
    },
    {
      "button": "button1",
      "count": 1,
      "modifiers": ["super", "shift"],
      "press_command": "drag_select",
      "command": "lsp_symbol_definition"
    },
    {
      "button": "button2",
      "count": 1,
      "modifiers": ["super", "shift"],
      "command": "jump_back"
    }
  ]
  ```

</details>

<details>
  <summary>bloop.sublime-build</summary>

  ```json
  {
    "selector": "source.scala",
    "working_dir": "$folder",
    "cmd": ["bloop test \\$(bloop projects | head -1) --only \"*${file_base_name}\" --only \"*${file_base_name}Spec\"  --no-color"],
    "shell": true,
    "variants": [
      {
        "name": "Test",
        "working_dir": "$folder",
        "cmd": ["bloop test \\$(bloop projects | head -1) --only \"*${file_base_name}\" --only \"*${file_base_name}Spec\" --no-color"],
        "shell": true
      },
      {
        "name": "Test All",
        "working_dir": "${folder}",
        "file_patterns": ["*.scala"],
        "cmd": ["bloop test \\$(bloop projects | head -1) --no-color"],
        "shell": true
      },
      {
        "name": "Clean",
        "working_dir": "${folder}",
        "cmd": ["bloop clean --no-color"],
        "shell": true
      },
      {
        "name": "Import Build",
        "working_dir": "$folder",
        "cmd": ["sbt -Dsbt.color=never bloopInstall && bloop compile \\$(bloop projects | head -1) --no-color"],
        "keyfiles": ["metals.sbt"],
        "shell": true
      },
    ]
  }
  ```

</details>

## Wishlist

- Organise Imports
- Remove Unused Imports

---

Command (or Cmd) ⌘
Shift ⇧
Option (or Alt) ⌥
Control (or Ctrl) ⌃
Caps Lock ⇪
Fn
