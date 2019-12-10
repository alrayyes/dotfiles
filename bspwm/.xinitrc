setxkbmap -option caps:escape

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Enable numberlock
if [ -x /usr/bin/numlockx ]; then
      /usr/bin/numlockx on
fi

export _JAVA_AWT_WM_NONREPARENTING=1 
export AWT_TOOLKIT=MToolkit 
wmname LG3D

exec bspwm
