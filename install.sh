#!/bin/bash
echo "Updating System.."
yay -Syyu #
echo "Installing Dependancies.."
if (yay -Syy nerdfonts-installer-bin rofi jgmenu lolcat playerctl boomer betterlockscreen dunst rofi picom polybar fastfetch wmctrl maim xclip xorg-xrandr python-i3ipc dbus alacritty zsh feh nitrogen alttab snixembed network-manager-applet blueman unclutter python-pywal16 tmux --noconfirm --quiet 2>/dev/null); then
	echo "Dependancies Installed"
	echo "Installing Nerd Fonts"
	if yes 46 43  | nerdfonts-installer 2>/dev/null; then # install mononoki & monaspice
		echo "Installed Mononoki Nerd Font"
		echo "Installed Monaspice Nerd Font"

		# Make requried dirs
		if [ -d "$HOME/Pictures/Wallpapers" ];then
			echo "Wallpapers Directory Already Exists.. Skipping"
		else 
			mkdir "$HOME/Pictures/Wallpapers"
			echo "Created Wallpapers Directory in ~/Pictures"
		fi 

		if [ -d "$HOME/Pictures/screenshots" ];then
			echo "screenshots Directory Already Exists.. Skipping"
		else 
			mkdir "$HOME/Pictures/screenshots"
		fi
		echo "Successfully Installed!"
	else
		echo "nerdfont-installer failed:"
	fi 
fi
