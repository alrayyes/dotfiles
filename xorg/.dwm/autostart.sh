#!/bin/sh

xautolock -time 10 -locker ~/.bin/lock.sh &
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
