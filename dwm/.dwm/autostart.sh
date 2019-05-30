#!/bin/sh

# Set screen orientation if second monitor is connected
SCREENCOUNT=$(xrandr | grep -c "\*")

# If multi screen add special mode for monitor so it supports 1440p over HDMI
if [ "$SCREENCOUNT" -eq 2 ]
then
    if [ -f "$HOME/.screenlayout/screen_desktop.sh" ]
    then
        /bin/sh ~/.screenlayout/screen_desktop.sh
        # Make sure mouse is on main screen so windows are launched there
        xdotool mousemove 3360 1080
    fi
else
    if [ -f "$HOME/.screenlayout/screen.sh" ]
    then
        /bin/sh ~/.screenlayout/screen.sh
    fi
fi

# lock screen after x minutes and on laptop close lid
xautolock -time 10 -locker lock &
xss-lock lock &

xbindkeys &
xcompmgr &

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
redshift-gtk &
dunst &
slstatus &

exec st -c tmux -e tmux & 
exec spotify &

if [ -e /usr/bin/firefox ]
then
    exec firefox &
elif [ -e /usr/bin/iceweasel ]
then
    exec iceweasel &
fi
