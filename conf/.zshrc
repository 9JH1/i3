 	#z4h settings 
	zstyle ':z4h:' auto-update      'no'
	zstyle ':z4h:' auto-update-days '28'
	zstyle ':z4h:bindkey' keyboard  'pc'
	zstyle ':z4h:' prompt-at-bottom 'no'
	zstyle ':z4h:' term-shell-integration 'yes'
	zstyle ':z4h:autosuggestions' forward-char 'accept'
	zstyle ':z4h:fzf-complete' recurse-dirs 'no'
	zstyle ':z4h:direnv'         enable 'no'
	zstyle ':z4h:direnv:success' notify 'yes'
	
	if [ "$ZSH_ISOLATE" -eq  "0" ]; then
		zstyle ':z4h:' start-tmux command ""
	else
		zstyle ':z4h:' start-tmux command tmux -u -f ~/.config/i3/conf/tmux.conf new-session -A
	fi
	
	# define settings for greeter loading
	stty -echo -icanon
	echo -ne '\033[?25l'
	if [ -n "$TMUX" ] && [ "$(tmux display-message -p '#{pane_index}')" = "0" ] && [ "$(tmux display-message -p '#{window_index}')" = "0" ] && [ -z "$FASTFETCH_SHOWN" ]; then
		#fastfetch --logo arch_old --config "$HOME/.config/i3/conf/fastfetch.jsonc" | lolcat > /dev/tty 
		#read > /dev/tty 
		if [ "$ZSH_ISOLATE" = "1" ]; then
			fastfetch --logo $(cat ~/.i3wallpaper) --config "$HOME/.config/i3/conf/fastfetch.jsonc" --logo-width 30
			read > /dev/tty
		fi
	fi
	echo -ne '\e[?25h'
	stty sane

	z4h init

# custom cd functions for better navigation
export localcd=""
function cd(){
	builtin cd "$@"
	echo "$(pwd)" > ~/.pwd.tmp
}

function n(){
	nvim "$@"
}

function cds(){
	localcd="$(cat ~/.pwd.tmp)"
}
function cdd(){
	cd "$localcd"
}

# move to last cd'd dir
cds

function linecount(){
	ls -R | wc -l
}

function true-colors(){
awk -v term_cols="${width:-$(tput cols || echo 80)}" 'BEGIN{
    s="/\\";
    for (colnum = 0; colnum<term_cols; colnum++) {
        r = 255-(colnum*255/term_cols);
        g = (colnum*510/term_cols);
        b = (colnum*255/term_cols);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum%2+1,1);
    }
    printf "\n";
}'

}

function cdr() {
	dirs=(*/)
	[[ $dirs ]] && cd -- "${dirs[RANDOM%${#dirs[@]}]}"
}

# Define aliases.
alias tree='tree -a -I .git'

function ls {
	lsd $@ --color=auto -r -t
}
