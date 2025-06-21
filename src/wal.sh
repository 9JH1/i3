#!/bin/bash
first_wal=""
WALLPAPER_DIR="/home/$USER/Pictures/Wallpapers/"

if [[ ! -d "$WALLPAPER_DIR" ]]; then
    echo "Error: Wallpaper directory $WALLPAPER_DIR does not exist"
    exit 1
fi

if [[ -n "$1" ]]; then
  echo "Argument found"
  if [[ "$1" = "--exclude-hidden" ]]; then
    echo "Picking non-hidden wallpaper"
  	first_wall=$(find -L "$WALLPAPER_DIR" -type f -not -path "*/.*/*" | shuf -n 1)
  else
		echo "Picking universal wallpaper"
		first_wall=$(find -L "$WALLPAPER_DIR" -type f -path "*/.*/*" | shuf -n 1)
	fi
	touch $HOME/.i3wallpaper
	echo "$first_wall" > $HOME/.i3wallpaper
else 
	echo "No argument provided, using previous wallpaper"
	first_wall=$(cat ~/.i3wallpaper)
fi 

# VIDEO WALLPAPER SECION (https://github.com/9jh1/C -> projects/motionlayer/src)
#killall motionlayer
#motionlayer --geometry "1920x1080+0+0" --path "/drive/backgrounds/c8d502bf002baf521032f63869bac47472ef2f53.webm" --randomize --zoom 0.1 --frame-out "$HOME/.frame.jpg" & 
#sleep 1 
#first_wall="$HOME/.frame.jpg"
#echo "$first_wall" > $HOME/.i3wallpaper
export XDG_CACHE_HOME="$HOME/.cache" &> /dev/null &

wal -i "$first_wall" -n -a 92

# run deps 
$HOME/.config/i3/src/dunst.sh &> /dev/null & # reload dunst 
$HOME/.config/i3/src/reloadwalgtk.sh &> /dev/null & # reload gtk 
$HOME/.config/i3/src/kitty.sh no-run & # reload alacritty ( sometimes it wont update by just running pywal )
ln -s $HOME/.cache/wal/colors-tauon.ttheme $HOME/.local/share/TauonMusicBox/theme/pywal-tauon.ttheme & # reload tauon music box colors
walcord &> /dev/null # reload discord
# install pywalfox for firefox colors it auto updates

$HOME/.config/i3/src/kill_polybar.sh
$HOME/.config/i3/src/polybar.sh & 
$HOME/.config/i3/src/fullscreen_listener.sh &

# set solid colors
source "$HOME/.cache/wal/colors.sh"
hex="$background"
solid_color_ppm=$(mktemp --suffix=.ppm)
printf "P6\n1 1\n255\n\\x${hex:1:2}\\x${hex:3:2}\\x${hex:5:2}" > $solid_color_ppm
(feh --bg-scale "$solid_color_ppm" && rm -f "$solid_color_ppm" ) 

# set wallpaper on primary monitor
xwallpaper --output $(xrandr | grep "primary" | awk '{print $1}')  --zoom "$first_wall" > /dev/null 2>&1

