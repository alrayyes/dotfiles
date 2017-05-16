# Weechat IRC profile
noblacklist ${HOME}/.weechat 
noblacklist ${HOME}/.config/qutebrowser 
read-write ${HOME}/dotfiles/weechat/.weechat/weechat.log
read-write ${HOME}/dotfiles/weechat/.weechat/urls.log
read-write ${HOME}/dotfiles/weechat/.weechat/logs
include /etc/firejail/disable-common.inc
include /etc/firejail/disable-programs.inc

caps.drop all
netfilter
nonewprivs
noroot
protocol unix,inet,inet6
seccomp

# no private-bin support for various reasons:
# Plugins loaded: alias, aspell, charset, exec, fifo, guile, irc,
# logger, lua, perl, python, relay, ruby, script, tcl, trigger, xferloading plugins 
