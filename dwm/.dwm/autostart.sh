#!/bin/sh

# lock screen after x minutes and on laptop close lid
xautolock -time 10 -locker ~/.scripts/lock.sh &
xss-lock ~/.scripts/lock.sh &

xbindkeys &
compton --xrender-sync-fence &
feh --bg-scale ~/.config/wall.png &
unclutter &
redshift-gtk &
dunst &
slstatus &

exec st -c tmux -e tmux & 
exec spotify &
exec firefox &
