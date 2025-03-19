out=$(python /home/$USER/.config/i3/src/spotify.py -f '{artist}/{song}')
if [[ out == "" ]]; then
				echo "spotify not running"
else
				echo $out
fi
