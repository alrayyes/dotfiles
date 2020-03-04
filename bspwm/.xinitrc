setxkbmap -option caps:escape
xrdb -merge -I$HOME ~/.Xresources

# Keybindings
sxhkd &

# Make things pretty
wal -R
~/.local/bin/wallpaper
picom -b
wmname LG3D &

exec bspwm
