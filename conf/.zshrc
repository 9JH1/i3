if [ "$(tmux display-message -p '#{window_panes}')" -le 1 ]; then
    fastfetch --config "$HOME/.config/i3/conf/fastfetch.jsonc"
fi
zstyle ':z4h:' start-tmux command tmux -u -f ~/.config/i3/conf/tmux.conf new-session -A
zstyle ':z4h:' auto-update      'no'
zstyle ':z4h:' auto-update-days '28'
zstyle ':z4h:bindkey' keyboard  'pc'
zstyle ':z4h:' prompt-at-bottom 'no'
zstyle ':z4h:' term-shell-integration 'yes'
zstyle ':z4h:autosuggestions' forward-char 'accept'
zstyle ':z4h:fzf-complete' recurse-dirs 'no'
zstyle ':z4h:direnv:success' notify 'yes'
zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
zstyle ':z4h:ssh:*'                   enable 'no'
export TERM=xterm-256color 
z4h init || return
path=(~/bin $path)
export GPG_TTY=$TTY
z4h bindkey z4h-backward-kill-word  Ctrl+Backspace     Ctrl+H
autoload -Uz zmv
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

# Define aliases.
alias tree='tree -a -I .git'
alias ls="${aliases[ls]:-ls} --color=auto"
alias neofetch="hypfetch -b fastfetch"

# pnpm
export PNPM_HOME="/home/_3hy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

function cdr() {
	dirs=(*/)
	[[ $dirs ]] && cd -- "${dirs[RANDOM%${#dirs[@]}]}"
}
