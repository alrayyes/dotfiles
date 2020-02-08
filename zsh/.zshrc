source_if_exists() {
	if [[ -f $1 ]]; then
		source $1
	fi
}

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
	git clone https://github.com/b4b4r07/zplug ~/.zplug
fi
source ~/.zplug/init.zsh

# Spaceship theme
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# Oh my zsh lugins
# sudo must start after vi-mode for it to work properly
zplug "plugins/archlinux", from:oh-my-zsh
zplug "plugins/composer", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh
zplug "plugins/pass", from:oh-my-zsh
zplug "plugins/ripgrep", from:oh-my-zsh
zplug "plugins/rsync", from:oh-my-zsh
zplug "plugins/systemd", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/yarn", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions", from:github, defer:3
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3

# Install packages
if ! zplug check --verbose; then
	printf "Install zplug plugins? [y/N]: "
	if read -q; then
		echo
		zplug install
	fi
fi

zplug load

# vim alias
alias vim="nvim"
alias vi="nvim"

# ls alias
alias ls="exa"
alias l="exa -al"

# vifm alias
alias vifm="vifmrun"

# Use lf to switch directories and bind it to ctrl-o
lfcd() {
	tmp="$(mktemp)"
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}

bindkey -s '^o' 'lfcd\n'

# Set GPG TTY
export GPG_TTY="$(tty)"

# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

# Needed for broot
source /home/alrayyes/.config/broot/launcher/bash/br

source_if_exists /usr/share/fzf/key-bindings.zsh

neofetch
