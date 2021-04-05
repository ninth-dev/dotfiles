#!/bin/bash
set -euo pipefail

source_dir="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
sublime_preference="${source_dir}/Preferences.sublime-settings"

cp "${sublime_preference}" "${sublime_preference}.bkup"

## remove the typescript_tsdk
cat "$sublime_preference.bkup" \
  | jq 'del(.typescript_tsdk)' > "${sublime_preference}.tmp"

mv "${sublime_preference}.tmp" "${sublime_preference}"
echo "Resetted typescript_tsdk => "$(jq '.typescript_tsdk' "${sublime_preference}")
echo " - Please restart SublimeText "
echo "┬─┬ノ( º _ ºノ) - DONE"

