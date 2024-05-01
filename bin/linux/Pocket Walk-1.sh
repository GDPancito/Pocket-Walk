#!/bin/sh
echo -ne '\033c\033]0;Pocket Walk\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Pocket Walk-1.x86_64" "$@"
