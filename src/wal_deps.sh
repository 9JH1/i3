#!/bin/bash

# important things first
echo "Reloading Dunst"
$HOME/.config/i3/src/dunst.sh >/dev/null &
echo "Killing Polybar"
$HOME/.config/i3/src/kill_polybar.sh >/dev/null 
echo "Starting Polybar"
$HOME/.config/i3/src/polybar.sh &>/dev/null &
echo "Starting Fullscreen Listener Script"
$HOME/.config/i3/src/fullscreen_listener.sh >/dev/null &
echo "Killing Plank"
killall plank
echo "Starting Plank"
plank >/dev/null &

# reload I3 and everything else that we dident reload 
# because of the pywal -e flag this part is copyed from 
# the offical reload.py file on pywals github, its just 
# been translated into bash.
echo "Reloading TTY"
sh "$HOME/.cache/wal/colors-tty.sh"
echo "Reloading XRDB"
xrdb -merge -quiet "$HOME/.cache/wal/colors.Xresources"
echo "Reloading I3"
i3-msg reload

# less important things 
echo "Reloading Kitty"
$HOME/.config/i3/src/kitty.sh no-run >/dev/null & 
echo "Reloading Walcord"
walcord &>/dev/null &
echo "Reloading GTK"
$HOME/.config/i3/src/reloadwalgtk.sh >/dev/null &
echo "Done"
