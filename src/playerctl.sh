#!/bin/bash
if [ "$(playerctl status)" = "Stopped" ]; then
	echo ""
else
	playerctl metadata --format '{{ artist }} - %{T2}{{ title }}%{T-}'
fi
