#!/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

###---Load xresources---###
xrdb -load ~/.config/X11/xresources

###---Keyboard---###
setxkbmap -option caps:escape

###---Get monitor count---###
SCREENCOUNT=$(xrandr | grep -c "\*")

###---Monitors---###
if [ "$SCREENCOUNT" -eq 2 ]; then
    if [ -f "$HOME/.local/bin/screen_desktop" ]; then
        screen_desktop
    fi
else
    if [ -f "$HOME/.local/bin/screen" ]; then
        screen
    fi
fi

###---Wallpaper & opacity---###
~/.local/bin/wallpaper
wal -n -R
picom -b

run unclutter
run xbanish
run nm-applet
run pasystray
run redshift-gtk
run syncthing-gtk
run caffeine
run clipmenud

run firefox
run emacs
run gpodder
run spotify

if [ "$SCREENCOUNT" -eq 2 ]; then
    run slack
fi

###---System lock---###
pkill -f xss-lock
xset s 300 5
env XSECURELOCK_FONT="Hack Nerd Font" xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &

###---Misc---###
# Needed for Jetbrains products to work
wmname LG3D &
