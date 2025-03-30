#!/bin/bash
file_path=~/Pictures/screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png
maim -s "$file_path" && xclip -selection clipboard -t image/png -i "$file_path"
