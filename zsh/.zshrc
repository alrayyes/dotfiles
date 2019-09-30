# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aws archlinux bower common-aliases composer docker extract fzf git git-flow gitignore httpie pass rsync sudo symfony2 systemd tmux vi-mode yarn zsh-syntax-highlighting )

source $ZSH/oh-my-zsh.sh

# ls alias
alias ls="lsd"
alias l="lsd -al"

# vifm alias
alias vifm="vifmrun"
alias vim="nvim"
alias vi="nvim"

# ls alias
alias ls="lsd"
alias l="lsd -al"

# vifm alias
alias vifm="vifmrun"

# Set GPG TTY
export GPG_TTY="$(tty)"
# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

neofetch
