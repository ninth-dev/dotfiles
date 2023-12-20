#!/bin/bash
set -uo pipefail

SCALAFMT_NATIVE_INSTALL_DIRECTORY="$HOME/.scalafmt-native"

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
  curl https://raw.githubusercontent.com/scalameta/scalafmt/master/bin/install-scalafmt-native.sh | \
  bash -s -- "${version}" "${scalafmt_native_path}"
fi

"${scalafmt_native_path}" "${@}"

