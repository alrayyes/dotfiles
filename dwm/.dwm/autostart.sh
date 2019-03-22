#!/bin/sh

# lock screen after x minutes and on laptop close lid
xautolock -time 10 -locker lock &
xss-lock lock &

xbindkeys &
compton --xrender-sync-fence &
feh --bg-scale ~/.cache/wall.png &
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
