#!/bin/sh

###---Start app if not running already---###
start_if_not_running() {
    ###---iceweasel/firefox is weird---###
    if [ "$1" = "iceweasel" ]; then
        PROCESS_NAME="iceweasel|MainThread"
    elif [ "$1" = "element-desktop-nightly" ]; then
        PROCESS_NAME="element-desktop"
    else
        PROCESS_NAME=$1
    fi

    if [ "$(pgrep -u "$(id -u)" -x "$PROCESS_NAME" | wc -l)" -lt 1 ]; then
        if command -v "$1"; then
            eval "$1 &"
        fi
    fi
}

###---Start app in alacritty if not running already---###
start_shell_if_not_running() {
    if [ "$(pgrep -u "$(id -u)" -x "$1" | wc -l)" -lt 1 ]; then
        if command -v "$1"; then
            eval "st -c $1 -e $1 &"
        fi
    fi
}

# Set screen orientation if second monitor is connected
SCREENCOUNT=$(xrandr | grep -c "\*")

# If multi screen add special mode for monitor so it supports 1440p over HDMI
if [ "$SCREENCOUNT" -eq 2 ]; then
    if [ -f "$HOME/.local/bin/screen_desktop" ]; then
        screen_desktop &
        # Make sure mouse is on main screen so windows are launched there
        xdotool mousemove 3360 1080 &
    fi
else
    if [ -f "$HOME/.local/bin/screen" ]; then
        screen &
    fi
fi

###---Set working directory---###
cd ~ || exit

###---Load xresources---###
xrdb -load ~/.config/X11/xresources &

###---Sxhkd---###
start_if_not_running sxhkd

###---Keyboard---###
setxkbmap -option caps:escape &

###---Wallpaper, colours & opacity---###
~/.local/bin/wallpaper &
wal -n -R &
picom -b &
sh ~/.cache/wal/colors.sh &

###---Switch off microphones---###
# switch off microphones
amixer -c 2 set Mic nocap &
amixer -c 3 set Mic nocap &

###---Autostart---###
start_if_not_running dunst
start_if_not_running unclutter
start_if_not_running nm-applet
start_if_not_running pasystray
start_if_not_running redshift-gtk
start_if_not_running syncthing-gtk
start_if_not_running caffeine

start_if_not_running brave
start_if_not_running iceweasel
start_if_not_running firefox
start_if_not_running emacs
start_if_not_running element-desktop
start_if_not_running element-desktop-nightly

if [ "$SCREENCOUNT" -eq 2 ]; then
    start_shell_if_not_running castero
    start_if_not_running slack
fi

###---System lock---###
pkill -f xss-lock
xset s 300 5 &
env XSECURELOCK_FONT="Hack Nerd Font" xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &

###---Misc---###
# Needed for Jetbrains products to work
wmname LG3D &
