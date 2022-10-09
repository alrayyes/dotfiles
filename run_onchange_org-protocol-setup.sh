#!/bin/sh

# Refresh xgd
if test "$(grep -c 'x-scheme-handler/org-protocol=org-protocol.desktop' ~/.config/mimeapps.list)" -eq 0; then
	echo "Refreshing xgd to handle org-protocol"
	update-desktop-database ~/.local/share/applications/
	xdg-mime default org-protocol.desktop x-scheme-handler/org-protocol
fi
