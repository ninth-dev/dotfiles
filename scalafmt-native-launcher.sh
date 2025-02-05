#!/bin/bash
set -uo pipefail

SCALAFMT_NATIVE_INSTALL_DIRECTORY="$HOME/.scalafmt-native"

CWD=$(pwd)

scalafmt_config=".scalafmt.conf"

if [[ ! -f "$scalafmt_config" ]]; then
  echo >&2 "ERROR: .scalafmt.conf missing.";
  exit 1
fi

# extract the version of scalafmt
version=$(
  sed -E "s/(\/\/|#).*//g" ${scalafmt_config} \
  | rg "version" \
  | sed -E "s/version|=|\"|\s*//g" \
  | xargs
)

if [[ -z "$version" ]]; then
  echo >&2 "ERROR: unable to detect scalafmt version.";
  exit 1
fi

scalafmt_native_path="${SCALAFMT_NATIVE_INSTALL_DIRECTORY}/${version}"

if [[ ! -f "$scalafmt_native_path" ]]; then
  NAME="scalafmt-x86_64-apple-darwin"
  VERSION="v${version}"
  TMP=$(mktemp -d)
  INSTALL_LOCATION="${scalafmt_native_path}"

  cd "$TMP"

  curl --fail -Lo "${NAME}.gz" https://github.com/VirtusLab/scalafmt-native-image/releases/download/$VERSION/"${NAME}.gz"
  gunzip "${NAME}.gz"

  cp $NAME "$INSTALL_LOCATION"

  chmod +x "$INSTALL_LOCATION"
  cd "$CWD"
  rm -rf "$TMP"
  echo Installed "$INSTALL_LOCATION"
fi

"${scalafmt_native_path}" "${@}"

