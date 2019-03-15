#!/bin/sh

xautolock -time 10 -locker slock &
xbindkeys &
compton --xrender-sync-fence &
feh --bg-scale ~/.config/wall.png &
unclutter &
pasystray &
nm-applet &
redshift-gtk &
syncthing-gtk -m &
dunst &
slstatus &

exec st -c weechat -e weechat &
exec st -c mutt -e neomutt &
exec st -c ncmpcpp -e ncmpcpp &
exec spotify &
exec gpodder &
exec firefox &
