#!/bin/bash

# Prerequisite & inistalled apps
prerequisiteApps=(bat bmon broot caffeine-ng exa fslint fzf graphviz isync imagemagick lightdm-gtk-greeter mailcap neofetch npm pandoc-bin pamixer playerctl pipewire pipewire-pulse pulsemixer python ripgrep stow sxiv tldr trayer udisks2 unclutter xbanish xwallpaper yarn xprop zathura the_silver_searcher fd)
prerequisiteFonts=(ttf-linux-libertine noto-fonts noto-fonts-emoji ttf-liberation nerd-fonts-hack)
configuredApps=(alacritty bspwm emacs firejail git gnupg gtk lf dunst mpd mpv mpv-mpris ncmpcpp neomutt neovim picom redshift sxhkd tmux tuir weechat)
locales=(aspell-en hunspell-en_gb hunspell-en_us hunspell-nl)
golang=(go golangci-lint-bin)
shell=(shfmt shellcheck)
screenlock=(xsecurelock xss-lock)
dmenu=(clipmenu menu-calc)

install_app_if_not_exist() {
	apps=("$@")
	for app in "${apps[@]}"; do
		if test "$(pacman -Q | grep -c "$app")" -eq 0; then
			echo "Installing missing package $app"
			yay -S --noconfirm "$app"
		fi
	done
}

install_app_if_not_exist "${prerequisiteApps[@]}"
install_app_if_not_exist "${prerequisiteFonts[@]}"
install_app_if_not_exist "${configuredApps[@]}"
install_app_if_not_exist "${locales[@]}"
install_app_if_not_exist "${golang[@]}"
install_app_if_not_exist "${screenlock[@]}"
install_app_if_not_exist "${dmenu[@]}"
install_app_if_not_exist "${shell[@]}"
