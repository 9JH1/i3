#!/bin/bash
first_wall=$(find "$HOME/Pictures/Wallpapers" -type f  -maxdepth 1 | sort -R | head -n 1)
wal -i "$first_wall" -n -a 92 -q
source ~/.cache/wal/colors.sh
hex="$color3"
solid_color_ppm=$(mktemp --suffix=.ppm)
printf "P6\n1 1\n255\n\\x${hex:1:2}\\x${hex:3:2}\\x${hex:5:2}" > "$solid_color_ppm"
feh --bg-scale "$solid_color_ppm"
nitrogen --head=0 --set-zoom-fill "$first_wall"
# --bg-scale "$solid_color_ppm" --no-fehbg
rm -f "$solid_color_ppm"
