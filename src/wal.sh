#!/bin/bash

# get pywal colors
first_wall=$(find "/home/$USER/Pictures/Wallpapers" -type f | sort -R | head -n 1)
export XDG_CACHE_HOME="/home/$USER/.cache"
wal -i "$first_wall" -n -a 92 -q

# run deps 
("$HOME/.config/i3/src/dunst.sh" > /dev/null 2>&1) &
("$HOME/.config/i3/src/reloadwalgtk.sh" > /dev/null 2>&1) &

# set solid colors
source "/home/$USER/.cache/wal/colors.sh"
hex="$color3"
solid_color_ppm=$(mktemp --suffix=.ppm)
printf "P6\n1 1\n255\n\\x${hex:1:2}\\x${hex:3:2}\\x${hex:5:2}" > $solid_color_ppm
(feh --bg-scale "$solid_color_ppm" && rm -f "$solid_color_ppm") &&

# set wallpaper on primary monitor
xwallpaper --output $(xrandr | grep "primary" | awk '{print $1}')  --zoom "$first_wall" 
echo "Successfully set wallpaper!"
