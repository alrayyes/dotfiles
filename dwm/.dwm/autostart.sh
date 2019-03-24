#!/bin/sh

# Set screen orientation if second monitor is connected
SCREENCOUNT=$(xrandr | grep -c "\*")

if [ "$SCREENCOUNT" -eq 2 ]
then
    xrandr --newmode "2560x1440_40" 201.00 2560 2720 2984 3408 1440 1443 1448 1476 -hsync +vsync \
        && xrandr --addmode HDMI-2 2560x1440_40 \
        && xrandr --output DP-1 --mode 3840x2160 --primary --output HDMI-2 --mode 2560x1440_40 --left-of DP-1 --rotate left &
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
