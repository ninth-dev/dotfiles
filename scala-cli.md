Scala CLI 

## Installing

1. Use coursier to install `scala-cli`

```sh
cs install --contrib scala-cli
```

I prefer to use couriser because `brew` installs java as a dependency.

2. To validate scala-cli is install 

```sh
scala-version
```

3. Install the completions 

```
scala-cli install-completions
```

---

## Usage

```scala
//> using scala "2.13.10"
//> using lib "org.typelevel::cats-core:2.9.0"
//> using lib "org.typelevel::cats-effect:3.4.2"
//> using lib "co.fs2::fs2-core:3.4.0"

import cats.syntax.all._

```
