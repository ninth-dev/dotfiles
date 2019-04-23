#!/bin/bash
set -euo pipefail

source_dir="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
destination_dir="SublimeText/$(date +"%Y%m%d_%H%M%S")"
# make a folder with today's date in SublimeText folder

mkdir -p "$destination_dir"

# copy Packages/User/
rsync -rP "$source_dir" "$destination_dir/"

# move into there
echo "┬─┬ノ( º _ ºノ) - DONE"

