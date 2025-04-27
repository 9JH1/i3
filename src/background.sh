#first_wall="$(ls -t $HOME/Pictures/wallpaper/*.* 2>/dev/null | head -n 1)"
first_wall=$(find "$HOME/Pictures/Wallpapers" | sort -R | head -n 1)
echo "background one: $first_wall"
wal -i "$first_wall" -n -a 92
source ~/.cache/wal/colors.sh
hex="$color3"
echo "background two: $hex"
printf "P6\n1 1\n255\n\\x${hex:1:2}\\x${hex:3:2}\\x${hex:5:2}" | feh --bg-fill "$first_wall" --bg-scale  -
