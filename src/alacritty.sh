read -r -d '' ALACRITTY_CONFIG << EOM
[general]
import = ['~/.config/i3/conf/alacritty-extra.toml']

[window]
decorations="full"
dynamic_title=true

[font]
size = 15

[font.normal]
family='Mononoki Nerd Font'
style="bold"

[font.bold]
family='MonaspiceRN NFM'
style="bold"

[font.italic]
family='Victor Mono'
style='Bold Italic'

[terminal]

[terminal.shell]
program = "/bin/sh"
args = ["-c", "export ZDOTDIR=/home/$USER/.config/i3/conf/ && zsh"]
EOM
ALACRITTY_PATH="/home/$USER/.config/i3/conf/alacritty.toml"
ALACRITTY_COLORS=$(cat /home/$USER/.cache/wal/colors-alacritty.toml)
echo "$ALACRITTY_CONFIG" > "$ALACRITTY_PATH"
echo "$ALACRITTY_COLORS" >> "$ALACRITTY_PATH"
if [ -z $1 ]; then
	alacritty --config-file "$ALACRITTY_PATH"
fi
