#!/bin/bash -e

while getopts e: flag
do
    # shellcheck disable=SC2220
    case "${flag}" in
        e) command=${OPTARG};;
    esac
done
function tab() {
  osascript 2>/dev/null <<EOF
    tell application "Terminal"
      do script with command "cd \"$PWD\"; $*" in window 1
      do script with command "$command" in window 1
    end tell
EOF
}
# shellcheck disable=SC2119
tab
