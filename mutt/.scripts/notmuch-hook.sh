#!/bin/zsh
notmuch new
notmuch tag +inbox +new -- tag:new
notmuch tag -new -inbox +sent -- from:alrayyes@gmail.com or from:ryan@andthensome.nl
notmuch tag +gmail -- to:alrayyes@gmail.com
notmuch tag +andthensome -- to:ryan@andthensome.nl

ACCOUNTS=( "gmail" "andthensome")
for ACCOUNT in "${ACCOUNTS[@]}"
do
NEWDIRS=$(ls ~/mail/$ACCOUNT/inbox/new/ | wc -l)
if [ ! "$NEWDIRS" -eq "0" ]; then
    notify-send "New Mails ${ACCOUNT}" "$NEWDIRS" -i mail-message-new
fi
done
