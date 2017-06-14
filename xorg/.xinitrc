setxkbmap -option caps:escape

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Enable numberlock
if [ -x /usr/bin/numlockx ]; then
      /usr/bin/numlockx on
fi

exec i3
