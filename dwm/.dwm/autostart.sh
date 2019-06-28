#!/bin/sh

# Set screen orientation if second monitor is connected
SCREENCOUNT=$(xrandr | grep -c "\*")

# If multi screen add special mode for monitor so it supports 1440p over HDMI
if [ "$SCREENCOUNT" -eq 2 ]
then
    if [ -f "$HOME/.local/bin/screen_desktop" ]
    then
        screen_desktop
        # Make sure mouse is on main screen so windows are launched there
        xdotool mousemove 3360 1080
    fi
else
    if [ -f "$HOME/.local/bin/screen" ]
    then
        screen
    fi
fi

# lock screen after x minutes and on laptop close lid
xautolock -time 10 -locker ~/.local/bin/lock &
xss-lock -- ~/.local/bin/lock &
xcompmgr &
sxhkd &

if [ -e ~/.cache/wall1.png ] &&  [ -e ~/.cache/wall2.png ]
then
    xwallpaper --output HDMI-2 --zoom ~/.cache/wall2.png --output DP-1 --zoom ~/.cache/wall1.png &
elif [ -e ~/.cache/wall1.png ]
then
    xwallpaper --output eDP1 --zoom ~/.cache/wall1.png &
fi

# switch off microphones
amixer -c 2 set Mic nocap
amixer -c 3 set Mic nocap

unclutter &
dunst &
slstatus &

redshift-gtk &
nm-applet &
syncthing-gtk &

exec st -c tmux -e tmux & 
exec spotify &

if [ -e /usr/bin/firefox ]
then
    exec firefox &
elif [ -e /usr/bin/iceweasel ]
then
    exec iceweasel &
fi
