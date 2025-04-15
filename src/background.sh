first_wall="$(ls -t $HOME/Pictures/wallpaper/*.* 2>/dev/null | head -n 1)"
second_wall="$(ls -t $HOME/Pictures/Games/assettocorsa/*.* 2>/dev/null | head -n 1)"
#bg="$(cat ~/.fehbg | grep -oP "'\K[^']+(?=')")" 
wal -i "$first_wall" -n -a 92
feh "$first_wall" --bg-fill "$second_wall" --bg-fill

# -- video-background --
#killall mpv xwinwrap
#wallpaper-engine -p /home/$USER/Videos/backgrounds/rei.mp4 -sx 1920 -sy 1080 -z 0
