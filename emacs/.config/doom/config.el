;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;; General settings
(setq doom-font (font-spec :family "FuraCode Nerd Font Mono" :size 12)
      doom-theme 'doom-molokai)

;; projectile
(use-package! projectile
  :config
  (setq projectile-project-search-path '("~/devel/personal/" "~/devel/andthensome/" "~/Documents/")))

;; irc
(use-package! circe
  :config
  (setq circe-network-options
        `(
          ("znc-freenode"
           :host "irc.higherlearning.eu"
           :port "5000"
           :tls t
           :user "l0rd/freenode"
           :server-buffer-name "⇄ Freenode (ZNC)"
           :pass (lambda (&rest _) (+pass-get-secret "controlpanel/irc.higherlearning.eu"))
           :channels ("#emacs"))
          ("znc-snoonet"
           :host "irc.higherlearning.eu"
           :port "5000"
           :tls t
           :user "l0rd/snoonet"
           :server-buffer-name "⇄ Snoonet (ZNC)"
           :pass (lambda (&rest _) (+pass-get-secret "controlpanel/irc.higherlearning.eu"))
           :channels ("#islam"))
          ))
  :hook (circe-channel-mode . enable-lui-autopaste)
  )

;; notmuch
(use-package! notmuch
  :config
  (setq +notmuch-sync-backend 'mbsync
        +notmuch-sync-command "mailsync"
        sendmail-program "/usr/bin/msmtp"
        message-sendmail-f-is-evil t
        message-sendmail-extra-arguments '("--read-envelope-from")
        message-send-mail-function 'message-send-mail-with-sendmail)
  )

;; org
(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)
  )
(setq org-directory "~/Documents/org/"
      org-log-done 'note)

;; temporarily fix bug
;; (fset 'battery-update #'ignore)
