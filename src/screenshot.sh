#!/bin/bash
file_path=~/Pictures/screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png
maim "$file_path"	
flameshot gui
# ^ ^ ^ ^ ^  New program :DD 
