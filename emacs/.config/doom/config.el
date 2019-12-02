;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;; General settings
(setq doom-font (font-spec :family "FuraCode Nerd Font Mono" :size 12)
      doom-theme 'doom-molokai)

;; projectile
(setq projectile-project-search-path '("~/devel/personal/" "~/devel/andthensome/" "~/Documents/" "~"))

;; irc
(add-hook 'circe-channel-mode-hook 'enable-lui-autopaste)
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

;; temporarily fix bug
(fset 'battery-update #'ignore)
