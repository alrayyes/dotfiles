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
path_if_exists ~/.local/share/go/bin 
path_if_exists ~/.local/share/cargo/bin

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

# Make sure pass uses the proper directory
export PASSWORD_STORE_DIR=~/.local/share/pass

# Use alternative muhome
export MU_HOME=~/.cache/mu

# Load xinit from the proper directory
export XINITRC=~/.config/X11/xinitrc

# This needs to be set for bspwm to see config
export XDG_CONFIG_HOME="$HOME/.config"

# Rust
export CARGO_HOME=~/.local/share/cargo
export RUSTUP_HOME=~/.local/share/rustup

# Golang
export GOPATH=~/.local/share/go

# Enable icons in lf
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"

# Save history file in proper place
HISTFILE=~/.cache/zsh/history

# Load config files from their proper place
ZDOTDIR=~/.config/zsh

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
