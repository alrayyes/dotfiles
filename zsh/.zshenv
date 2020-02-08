path_if_exists() {
	if [[ -d $1 ]]; then
		export PATH="$1:$PATH"
	fi
}

# Stop tmux bitching about 256 colours
TERM="xterm-256color"

# PATH
path_if_exists ~/.config/yarn/global/node_modules/.bin
path_if_exists ~/.local/bin
path_if_exists ~/.emacs.d/bin

# Set GPG TTY
export GPG_TTY="$(tty)"

# Set default browser
if [ -e "/usr/bin/brave" ]; then
	export BROWSER="brave"
else
	if [ -e "/usr/bin/firefox" ]; then
		export BROWSER="firefox"
	elif [ -e "/usr/bin/iceweasel" ]; then
		export BROWSER="iceweasel"
	fi
fi

# Set default terminal
export TERMINAL="alacritty"

# pkg editor
export VISUAL="nvim"

# editor
export EDITOR="nvim"

# Enable password store extensions
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"

# This needs to be set for bspwm to see config
export XDG_CONFIG_HOME="$HOME/.config"

# Save history file in proper place
HISTFILE=~/.cache/zsh/history

# Use alternative muhome
export MU_HOME="/home/alrayyes/.cache/mu"

# Needed to get zsh to play nice with emacs vterm
if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
	alias clear='printf "\e]51;Evterm-clear-scrollback\e\\";tput clear'
fi
vterm_prompt_end() {
	printf "\e]51;A$(whoami)@$(hostname):$(pwd)\e\\"
}
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
