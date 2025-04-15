# Scala

Instructions on how I like to setup my local environment for Scala.

## Use [couriser](https://get-coursier.io/)

```bash
curl -fL https://github.com/VirtusLab/coursier-m1/releases/latest/download/cs-aarch64-apple-darwin.gz | gzip -d > cs
chmod +x cs
./cs setup --yes --jvm 17 --apps cs,sbt,bloop,scala-cli
rm cs
```

### Setup autocompletion

https://get-coursier.io/docs/cli-installation#zsh-completions

### How to switch version of Java

```bash
cs java --jvm 17 --setup
cs java --jvm 8 --setup
```

### [bloop](https://scalacenter.github.io/bloop/)

1. add bloop tab completion for zsh

```
# https://github.com/scalacenter/bloop/releases
mkdir -p "$HOME/.bloop"
curl -L https://github.com/scalacenter/bloop/releases/download/v1.5.15/zsh-completions -o "$HOME/.bloop/zsh-completions"
ln -s "$HOME/.bloop/zsh-completions" $HOME/.zsh/completions/_bloop
```

<!-- 1. add bloop settings

```sh
mkdir -p $HOME/.bloop
cat <<EOF > $HOME/.bloop/bloop.json
{
  "javaHome": "$JAVA_HOME" // output of the above command
  "javaOptions": ["-XX:+UseParallelGC"]
}
EOF
``` -->

### scalafmt-native

Use `scalafmt-native` for integration with [sublime-fmt](https://github.com/mitranim/sublime-fmt)

Using a [scalafmt-native-launcher](./scalafmt-native-launcher.sh).

```bash
ln -s "${PWD}/scalafmt-native-launcher.sh" /usr/local/bin/scalafmt-native
mkdir -p "$HOME/.scalafmt-native"
```

### bloop-which-project

Uses `bloop` to determine which project your Scala file belongs in

```bash
ln -s "${PWD}/bloop-which-project.sh" /usr/local/bin/bloop-which-project
```

This is used in conjuction with the [`bloop.sublime-build`](https://github.com/ninth-dev/SublimeText/blob/master/bloop.sublime-build)

---

Sublime FMT settings

```json
{
  "rules": [
    {
      "selector": "source.scala",
      "cmd": [
        "scalafmt-native",
        "--stdin",
        "--assume-filename",
        "$file_name",
        "--stdout",
        "--non-interactive"
       ],
    }
  ],
  "cwd_mode": "project_root",
  "format_on_save": true
}

```







