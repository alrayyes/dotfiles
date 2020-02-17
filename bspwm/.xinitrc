setxkbmap -option caps:escape
xrdb -merge -I$HOME ~/.Xresources

exec bspwm
