#!/bin/sh

# Setup broot if not done already
if [ ! -d ~/.local/share/broot ]; then
	broot --install
fi
