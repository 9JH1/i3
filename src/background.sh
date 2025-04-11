first_wall="$(ls -t $HOME/Pictures/wallpaper/*.* 2>/dev/null | head -n 1)"
second_wall="$(ls -t $HOME/Pictures/screens/*.* 2>/dev/null | head -n 1)"
#bg="$(cat ~/.fehbg | grep -oP "'\K[^']+(?=')")" 
wal -i "$first_wall" -n
feh "$first_wall" --bg-fill "$second_wall" --bg-fill
wal -R -n -q -s
