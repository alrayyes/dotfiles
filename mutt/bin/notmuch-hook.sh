#!/bin/sh
notmuch new
notmuch tag +inbox -new -- tag:new
notmuch tag -new -inbox +sent -- from:alrayyes@gmail.com or from:ryan@andthensome.nl
