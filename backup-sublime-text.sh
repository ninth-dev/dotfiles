#!/bin/bash
set -euo pipefail

source_dir="$HOME/Library/Application Support/Sublime Text/Packages/User"
now=$(date +"%Y%m%d_%H%M%S")
destination_dir="SublimeText/${now}"

# make a folder with today's date in SublimeText folder
mkdir -p "$destination_dir"

# copy Packages/User/
rsync -rP "$source_dir" "$destination_dir/"

if [[ -L "SublimeText/latest" ]]; then
  unlink "SublimeText/latest"
fi

ln -s "$now" "SublimeText/latest"

echo "┬─┬ノ( º _ ºノ) - DONE"

