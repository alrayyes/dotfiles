setxkbmap -option caps:escape
xrdb -merge -I$HOME ~/.Xresources

wal -R

exec bspwm
