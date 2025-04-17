#!/bin/bash
file_path=~/Pictures/screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png
maim "$file_path"	
maim -s | xclip -selection clipboard -t image/png 
