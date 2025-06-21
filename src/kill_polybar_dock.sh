#!/bin/bash 
FILE="$HOME/.i3dockpid"
if [[ -e "$FILE" ]]; then 
	while IFS= read -r line; do
		kill $line
	done < $FILE
	echo "" > $FILE
else 
	echo "$FILE does not exit"
	touch "$FILE"
fi
