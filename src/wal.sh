#!/bin/bash

is_video() {
	local file="$1"
  video_extensions="|gif|mp4|mkv|avi|mov|wmv|flv|webm|mpeg|mpg|m4v|3gp"
  if echo "$file" | grep -i -E "\.($video_extensions)$"; then return 0; fi
  return 1;
}

first_wall=""
killall motionlayer
if [[ "$1" = "--custom" ]];then
	if is_video "$2";then
		echo "detected video"
		# VIDEO WALLPAPER SECION (https://github.com/9jh1/C -> projects/motionlayer/src)
		motionlayer --path "$2" --frame-out "$HOME/.frame.jpg" & 
		sleep 1
		first_wall="$HOME/.frame.jpg"
		echo "$first_wall" > $HOME/.i3wallpaper
	else 
		echo "detected image"
		first_wall="$2";
	fi
else 
	WALLPAPER_DIR="/home/$USER/Pictures/Wallpapers/"
	if [[ ! -d "$WALLPAPER_DIR" ]]; then
    echo "Error: Wallpaper directory $WALLPAPER_DIR does not exist"
    exit 1
	fi
	if [[ -n "$1" ]]; then
  	echo "Argument found"
  	if [[ "$1" = "--exclude-hidden" ]]; then
    	echo "Picking non-hidden wallpaper"
  		wallpaper=$(find -L "$WALLPAPER_DIR" -type f -not -path "*/.*/*" | grep -v ".git" | shuf -n 1)
			$HOME/.config/i3/src/wal.sh --custom "$wallpaper";
			exit 
  	else
			echo "Picking universal wallpaper"
			wallpaper=$(find -L "$WALLPAPER_DIR" -type f -path "*/.*/*" | grep -v ".git" | shuf -n 1)
			$HOME/.config/i3/src/wal.sh --custom "$wallpaper"
			exit
		fi
	else 
		echo "No argument provided, using previous wallpaper"
		first_wall=$(cat ~/.i3wallpaper)
	fi 
fi

export XDG_CACHE_HOME="$HOME/.cache" &> /dev/null &
touch $HOME/.i3wallpaper

# only one dependancy is run before the rest, that is polybar 
# when wal is run it reloads polybar but we end up reloading it 
# manually using a kill-replace style script, if we kill it here
# then wal will not reload it, we dont want wall to reload it 
# because it animates the bar dissapearing twice which is not 
# ideal for visual candy.
echo "Killing Polybar"
# $HOME/.config/i3/src/kill_polybar.sh

# plank is a visual child process so it has to go too
#killall plank 

# run wal 
echo "Running PyWal"
echo "$first_wall" > $HOME/.i3wallpaper
wal -i "$first_wall" -t -s -n -a 92
echo "Done"

# set color
echo "Setting secondary monitor colors"
source ~/.cache/wal/colors.sh
hex="$background"
solid_color_ppm=$(mktemp --suffix=.ppm)
printf "P6\n1 1\n255\n\\x${hex:1:2}\\x${hex:3:2}\\x${hex:5:2}" > $solid_color_ppm
(feh --bg-scale "$solid_color_ppm" && rm -f "$solid_color_ppm" &)
if is_video "$2"; then  echo "skipping xwallpaper set"
else
	# set wallpaper on primary monitor
	echo "Setting primary wallpaper"
	output=$(xrandr | grep "primary" | awk '{print $1}')
	echo "Using monitor $output"
	feh --bg-fill "$first_wall"

	#xwallpaper --output  $output --zoom "$first_wall"
	echo "Set Wallpaper"
fi


# start deps 
echo "Running Deps"
echo "Done"
# ($HOME/.config/i3/src/wal_deps.sh &>/dev/null) &
