# Stop tmux bitching about 256 colours
TERM="xterm-256color"

# Path to your oh-my-zsh installation.
ZSH="/home/alrayyes/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# PATH 
export PATH="$PATH:/home/alrayyes/.config/yarn/global/node_modules/.bin:/home/alrayyes/.local/bin:/home/alrayyes/.emacs.d/bin"

# Set GPG TTY
export GPG_TTY="$(tty)"

# Set default browser
 if [ -e "/usr/bin/firefox" ]
then
    export BROWSER="firefox"
elif [ -e "/usr/bin/iceweasel" ]
then
    export BROWSER="iceweasel"
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
    printf "\e]51;A$(whoami)@$(hostname):$(pwd)\e\\";
}
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
