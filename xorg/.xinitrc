setxkbmap -option caps:escape
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

exec i3
