# Scala

Instructions on how I like to setup my local environment for Scala.

## Use couriser

```bash
curl -fLo cs https://git.io/coursier-cli-"$(uname | tr LD ld)"
chmod +x cs
./cs setup --yes --jvm 11 --apps ammonite,bloop,cs,giter8,sbt,scala,scalafmt
rm cs
```

This will install:

- [sbt](https://www.scala-sbt.org/)
- [Ammonite-REPL](https://ammonite.io/#Ammonite-REPL)
- [giter8]
- [scala]

### Setup autocompletion

```bash
cs --completions zsh > /usr/local/share/zsh/site-functions/_cs
```

### How to switch version of Java

```bash
cs java --jvm 11 --setup
cs java --jvm 8 --setup
```

### Enable Graal (JDK 10+)

NB: Doesn't work currently Apple M1

- `java --list-modules -version | rg jdk.internal.vm.compiler`
- `export JAVA_TOOL_OPTIONS="-XX:+UnlockExperimentalVMOptions -XX:+UseJVMCICompiler"`

XXX - check if this is required for graalvm

### [bloop](https://scalacenter.github.io/bloop/)

1. add bloop tab completion for zsh

```
curl -L https://github.com/scalacenter/bloop/releases/download/v1.4.11/zsh-completions -o "$HOME/.bloop/zsh-completions"
ln -s "$HOME/.bloop/zsh-completions" /usr/local/share/zsh/site-functions/_bloop
```

1. use graal vm instead since it should be faster

```
cs java --jvm graalvm-java11:21.0.0 --env
```

1. add bloop settings

```sh
mkdir -p $HOME/.bloop
cat <<EOF > $HOME/.bloop/bloop.json
{
  "javaHome": "???" // output of the above command
  "javaOptions": ["-XX:+UseParallelGC", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseJVMCICompiler"]
}
EOF
```

### scalafmt-native

Use `scalafmt-native` for integration with [sublime-fmt](https://github.com/mitranim/sublime-fmt)

Using a [scalafmt-native-launcher](./scalafmt-native-launcher.sh).

```bash
ln -s "${PWD}/scalafmt-native-launcher.sh" /usr/local/bin/scalafmt-native
mkdir -p "$HOME/.scalafmt-native"
```

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







