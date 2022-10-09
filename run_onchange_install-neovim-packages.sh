#!/bin/sh

# Install vim plugins & requirements
if test "$(pip list --user | grep -c 'pynvim')" -ne 1; then
	pip install --user pynvim
fi

# Install Neovim plugins
nvim +PlugInstall +qall

# Install Neovim coc extensions
yarn --cwd ~/.config/coc/extensions install
