#!/usr/bin/env bash
set -euo pipefail

# Usage
# - first arg: the file you want to determine
# - assumes running from same directory as .bloop

# Dependencies
# - bloop, jq

# get all the bloop projects
projects=($(bloop projects))

file="${1?"XXX"}"

for project in ${projects[*]}; do
  project_path=".bloop/${project}.json"
  project_name=$(cat "$project_path" | jq -r ".project.name")
  sources=($(cat "$project_path" | jq -r ".project.sources[]"))

  for src in ${sources[*]}; do
    ## check if beginning of the file path matches one of the src path
    if [[ $file =~ ^"$src"* ]]; then
      echo $project_name
      exit 0
    fi
    # check if the path exists
    # if [[ -d "$src" ]]; then
      ## check if the file exists in the path
      # file_found="$(fd --full-path "$file" "$src" | wc -l)"
      # if [[ "$file_found" -eq 1 ]]; then
      #   echo $project_name
      #   exit 0
      # fi
    # fi
  done
done

exit 1
