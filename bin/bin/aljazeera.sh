#!/bin/sh
rtmpdump -v -r rtmp://aljazeeraflashlivefs.fplive.net/aljazeeraflashlive-live/aljazeera_eng_high  -o -| mplayer -name aljazeera -
