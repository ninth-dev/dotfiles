#!/bin/bash
# This script reads URLs from stdin and opens each one in Firefox.

# Check if Firefox is installed
if ! open -Ra "Firefox"; then
  echo "Firefox is not installed or cannot be found in the Applications folder."
  exit 1
fi

# Check if input is coming from a pipe or a redirection; if not, print usage information.
if [ -t 0 ]; then
  echo "Usage: Provide a list of URLs via stdin."
  echo "Example: echo 'http://example.com' | $0"
  exit 1
fi

# Use xargs to open each URL in Firefox
xargs -I {} open -a "Firefox" "{}"
