#!/bin/bash
set -euo pipefail

source_dir="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
sublime_preference="${source_dir}/Preferences.sublime-settings"

cp "${sublime_preference}" "${sublime_preference}.bkup"

tsdk_path="$PWD/node_modules/typescript/lib"
[ ! -d "$tsdk_path" ] && echo "Not found: $tsdk_path" && exit 1;

# add the typescript_tsdk
cat "$sublime_preference.bkup" \
  | jq '. + { "typescript_tsdk": "'"${tsdk_path}"'" }' \
  > "${sublime_preference}.tmp"

mv "${sublime_preference}.tmp" "${sublime_preference}"
echo "Updated typescript_tsdk => "$(jq '.typescript_tsdk' "${sublime_preference}")
echo " - Please restart SublimeText "
echo "┬─┬ノ( º _ ºノ) - DONE"

