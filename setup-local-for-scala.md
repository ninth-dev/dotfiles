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
