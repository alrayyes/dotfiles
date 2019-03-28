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
compton --xrender-sync-fence &

if [ -e ~/.cache/wall1.png ] &&  [ -e ~/.cache/wall2.png ]
then
    feh --bg-scale ~/.cache/wall1.png --bg-scale ~/.cache/wall2.png &
elif [ -e ~/.cache/wall1.png ]
then
    feh --bg-scale ~/.cache/wall1.png &
fi

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
