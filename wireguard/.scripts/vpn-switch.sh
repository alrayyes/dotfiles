#!/bin/sh

###
# Switch wireguard vpns up/down
###

STATUS="$(nmcli device status | grep -c wg0)"

case $STATUS in
	1)
        sudo wg-quick down wg0
        sudo wg-quick down wg1
        notify-send  "down"
		;;
	*)
        sudo wg-quick up wg0
        sudo wg-quick up wg1
        notify-send  "up"
		;;
  esac
