#!/bin/bash
killall -q polybar 

for polypid in $(pgrep polybar); do 
	pkill -9 $polypid; 
done

first_wall=$(find -L "/home/$USER/Pictures/Wallpapers/" -type f| sort -R | head -n 1)
echo $first_wall
export XDG_CACHE_HOME="/home/$USER/.cache" &> /dev/null

wal -i "$first_wall" -n -a 92 -q

# run deps 
$HOME/.config/i3/src/dunst.sh &> /dev/null & # reload dunst 
$HOME/.config/i3/src/reloadwalgtk.sh &> /dev/null & # reload gtk 
$HOME/.config/i3/src/alacritty.sh --nolaunchcuh & # reload alacritty ( sometimes it wont update by just running pywal )
walcord &> /dev/null # reload discord

# install pywalfox for firefox colors it auto updates

polybar -c "/home/$USER/.config/i3/conf/polybar.ini" bar_main > /dev/null 2>&1 &

# set solid colors
source "/home/$USER/.cache/wal/colors.sh"
hex="$background"
solid_color_ppm=$(mktemp --suffix=.ppm)
printf "P6\n1 1\n255\n\\x${hex:1:2}\\x${hex:3:2}\\x${hex:5:2}" > $solid_color_ppm
(feh --bg-scale "$solid_color_ppm" && rm -f "$solid_color_ppm" ) 

# set wallpaper on primary monitor
xwallpaper --output $(xrandr | grep "primary" | awk '{print $1}')  --zoom "$first_wall" > /dev/null 2>&1

