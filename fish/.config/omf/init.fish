# Start X at login
if status is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        set -g -x SXHKD_SHELL '/usr/bin/sh'

        # Enable numberlock
        if [ -x "/usr/bin/numlockx" ]
            /usr/bin/numlockx on
        end

        exec startx -- -keeptty
    end
end

function fish_greeting
    cat ~/.cache/wal/sequences &
    neofetch
end

function path_if_exists
    if [ -d "$argv" ]
        set PATH $PATH "$argv"
    end
end

# Add paths
path_if_exists ~/.config/yarn/global/node_modules/.bin
path_if_exists ~/.local/bin
path_if_exists ~/.emacs.d/bin

# Set GPG TTY
set GPG_TTY (tty)

# Set default browser
if [ -e "/usr/bin/brave" ]
    set -g BROWSER "brave"
else
    if [ -e "/usr/bin/firefox" ]
        set -g BROWSER "firefox"
    else if [ -e "/usr/bin/iceweasel" ]
        set -g BROWSER "iceweasel"
    end
end

# Set default terminal
set -g TERMINAL "alacritty"

# pkg editor
set -g VISUAL "nvim"

# editor
set -g EDITOR "nvim"

# Enable password store extensions
set -g PASSWORD_STORE_ENABLE_EXTENSIONS "true"

# Use alternative muhome
set -g MU_HOME "/home/alrayyes/.cache/mu"

# bobthefish
set -g theme_nerd_fonts yes
set -g theme_color_scheme gruvbox

# sudope
set -g sudope_sequence \e\e

# nvim alias
alias v="nvim"
alias sv="sudo nvim"

# ls alias
alias ls="exa"
alias l="exa -al"

# vifm alias
alias vifm="vifmrun"

# pacman aliases
alias pacrmorphans="sudo pacman -Rs (pacman -Qtdq)"
alias pacrem="sudo pacman -Rns"

# git alaises
alias gpoat="git push origin --all && git push origin --tags"

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

# Set fzf keybindings here for now as they don't work with stable version of omf https://github.com/jethrokuan/fzf/issues/109
bind \co '__fzf_find_file'
bind \cr '__fzf_reverse_isearch'
bind \ec '__fzf_cd'
bind \eC '__fzf_cd --hidden'
bind \eO '__fzf_open'
bind \eo '__fzf_open --editor'

if bind -M insert >/dev/null 2>/dev/null
    bind -M insert \co '__fzf_find_file'
    bind -M insert \cr '__fzf_reverse_isearch'
    bind -M insert \ec '__fzf_cd'
    bind -M insert \eC '__fzf_cd --hidden'
    bind -M insert \eO '__fzf_open'
    bind -M insert \eo '__fzf_open --editor'
end

if set -q FZF_COMPLETE
    bind \t '__fzf_complete'
    if bind -M insert >/dev/null 2>/dev/null
        bind -M insert \t '__fzf_complete'
    end
end
