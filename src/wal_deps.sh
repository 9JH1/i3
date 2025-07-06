#!/bin/bash 

# important things first
echo "Reloading Dunst"
$HOME/.config/i3/src/dunst.sh &> /dev/null

echo "Starting Polybar"
$HOME/.config/i3/src/polybar.sh &
echo "Starting Fullscreen Listener Script"
$HOME/.config/i3/src/fullscreen_listener.sh &
echo "Reloading Plank"
plank &

# less important things 
echo "Reloading Kitty"
$HOME/.config/i3/src/kitty.sh no-run & 
echo "Reloading Walcord"
walcord &> /dev/null 
echo "Reloading GTK"
$HOME/.config/i3/src/reloadwalgtk.sh &> /dev/null & 
echo "Done"
