source "$HOME/.cache/wal/colors.sh"
echo $background
path="$HOME/.config/i3/conf/dunstrc"
echo "" > $path
echo "[global]" >> $path
echo "font = MonaspiceRN NFM 12" >> $path
echo "markup = full" >> $path
echo "format = \"<b>%s</b>\n<b>%b</b>\"" >> $path
echo "icon_position = left" >> $path
echo "icon_path = /"/"" >> $path
echo "max_icon_size = 64" >> $path
echo "show_indicators = false" >> $path
echo "separator_height = 2" >> $path
echo "padding = 2" >> $path
echo "frame_width = 2" >> $path
echo "separator_color = frame" >> $path
echo "shrink = yes" >> $path
echo "mouse_left_click = close_current" >> $path
echo "mouse_middle_click = do_action" >> $path
echo "mouse_right_click = close_current" >> $path
echo "frame_width = 5" >> $path
echo "width = (0,1000)" >> $path
echo "progress_bar = false" >> $path
echo "progress_bar_min_width = (0,1000)" >> $path

echo "[urgency_low]" >> $path

echo "foreground = \"$color3\"" >> $path
echo "background = \"$color0\"" >> $path
echo "frame_color = \"$color2\"" >> $path

echo "[urgency_normal]" >> $path
echo "foreground = \"$color3\"" >> $path
echo "background = \"$color0\"" >> $path
echo "frame_color = \"$color2\"" >> $path

echo "[urgency_critical]" >> $path
echo "foreground = \"#ffffff\"" >> $path
echo "background = \"#ff5050\"" >> $path
echo "frame_color = \"#ff0000\"" >> $path

dunst -config $path
