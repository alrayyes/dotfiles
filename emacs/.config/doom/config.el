(when window-system
  (if (> (x-display-pixel-width) 2560)
      (setq doom-font (font-spec :family "JetBrains Mono" :size 12))
    (setq doom-font (font-spec :family "JetBrains Mono" :size 16))))

(setq doom-theme 'doom-molokai)

(defun my-fetch-password (&rest params)
  (require 'auth-source)
  (let ((match (car (apply #'auth-source-search params))))
    (if match
        (let ((secret (plist-get match :secret)))
          (if (functionp secret)
              (funcall secret)
            secret))
      (error "Password not found for %S" params))))

(setq display-line-numbers-type `relative)

(use-package! projectile
  :config
  (setq projectile-project-search-path '("~/devel/personal/" "~/devel/andthensome/" "~/Documents/" "~/dotfiles" "~/private-dotfiles"))) ; Default paths

(use-package! circe
  :config
  (setq circe-network-options
        `(
          ("znc-freenode"
           :host "irc.higherlearning.eu"
           :port "5000"
           :tls t ;; Enable tls
           :user "l0rd/freenode"
           :server-buffer-name "⇄ Freenode (ZNC)"
           :pass (lambda (&rest _) (+pass-get-secret "controlpanel/irc.higherlearning.eu")) ;; Get password from pass
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
  )
(add-hook 'circe-channel-mode-hook 'enable-lui-autopaste)

(setq deft-directory "~/Documents/org-roam")

(after! org
  (map! :map org-mode-map
        :n "M-j" #'org-metadown
        :n "M-k" #'org-metaup)
  )

(add-hook 'auto-save-hook 'org-save-all-org-buffers)

(setq org-directory "~/Documents/org"
      org-agenda-files (directory-files-recursively "~/Documents/org/" "\.org$")
      org-log-done 'note
      org-startup-with-inline-images t)

(use-package! org-protocol-capture-html)

(after! org
  (add-to-list 'org-capture-templates '("w" "Web site" entry
                                        (file+olp "~/Documents/org/web.org" "Web")
                                        "* %c\n%U %?%:initial"))
  )

(setq org-roam-directory "~/Documents/org-roam")

(setq org-roam-graph-viewer "~/.local/bin/viewDotfile")

(setq org-journal-dir "~/Documents/org-roam")
(setq org-journal-date-prefix "#+title: ")
(setq org-journal-file-format "%Y-%m-%d.org")
(setq org-journal-date-format "%A, %d %B %Y")

(setq org-publish-project-alist
      '(("wiki"
         :base-directory "~/Documents/org-roam/"
         :publishing-directory "~/devel/personal/Ryankes.eu/wiki/content/"
         :publishing-function org-pandoc-export-to-markdown_mmd
         :select-tags ("export-blog")
         )))

(use-package! mu4e
  :config
  (setq sendmail-program "/usr/bin/msmtp"
        send-mail-function
        'smtpmail-send-it
        message-sendmail-f-is-evil
        t
        message-sendmail-extra-arguments
        '("--read-envelope-from")
        message-send-mail-function
        'message-send-mail-with-sendmail)
  (setq mu4e-maildirs-extension-custom-list '("/ryankes/INBOX" "/ryankes/Sent" "/ryankes/Drafts"
                                              "/ryankes/Archive" "/ryankes/Archive.quicknet"
                                              "/gmail/INBOX" "/gmail/Sent" "/gmail/Drafts"
                                              "/gmail/Archive" "/andthensome/INBOX" "/andthensome/Sent"
                                              "/andthensome/Drafts" "/andthensome/Archive")))
(setq mu4e-maildir "~/.local/share/mail"
      mu4e-maildir-shortcuts
      '(("/ryankes/INBOX" . ?r)
        ("/gmail/INBOX" . ?g)
        ("/andthensome/INBOX" . ?a))
      mu4e-mu-home
      "~/.cache/mu"
      mu4e-update-interval
      300
      mu4e-get-mail-command
      "mailsync"
      mu4e-enable-mode-line
      t
      mu4e-use-fancy-chars
      t
      mu4e-context-policy
      'pick-first
      mu4e-attachment-dir
      "~/Downloads/")
(after! mu4e
  ;; load package to be able to capture emails for GTD
  (require 'org-mu4e)

  (setq mu4e-contexts
        `(,(make-mu4e-context :name "Ryankes"
                              :match-func (lambda (msg)
                                            (when msg
                                              (string-match-p "^/ryankes"
                                                              (mu4e-message-field msg :maildir)))):vars'((user-mail-address . "ryan@ryankes.eu")
                                            (user-full-name . "Ryan")
                                            (mu4e-sent-folder . "/ryankes/Sent")
                                            (mu4e-drafts-folder . "/ryankes/Drafts")
                                            (mu4e-trash-folder . "/ryankes/Trash")
                                            (mu4e-refile-folder . "/ryankes/Archive")))
          ,(make-mu4e-context :name "Gmail"
                              :match-func (lambda (msg)
                                            (when msg
                                              (string-match-p "^/gmail"
                                                              (mu4e-message-field msg :maildir)))):vars'((user-mail-address . "alrayyes@gmail.com")
                                            (user-full-name . "Ryan")
                                            (mu4e-sent-folder . "/gmail/Sent")
                                            (mu4e-drafts-folder . "/gmail/Drafts")
                                            (mu4e-trash-folder . "/gmail/Trash")
                                            (mu4e-refile-folder . "/gmail/Archive")))
          ,(make-mu4e-context :name "Andthensome"
                              :match-func (lambda (msg)
                                            (when msg
                                              (string-match-p "^/andthensome"
                                                              (mu4e-message-field msg :maildir)))):vars'((user-mail-address . "ryan@andthensome.nl")
                                            (user-full-name . "Ryan Kes")
                                            (mu4e-sent-folder . "/andthensome/Sent")
                                            (mu4e-drafts-folder . "/andthensome/Drafts")
                                            (mu4e-trash-folder . "/andthensome/Trash")
                                            (mu4e-refile-folder . "/andthensome/Archive"))))))
(add-hook 'mu4e-view-mode-hook 'visual-line-mode)

(use-package! elfeed
  :config
  (setq elfeed-use-curl t)
  (elfeed-set-timeout 36000)
  (setq elfeed-protocol-ttrss-maxsize 200) ; bigger than 200 is invalid
  (elfeed-protocol-enable)
                                        ;
  (defadvice elfeed (after configure-elfeed-feeds activate)
    "Make elfeed-org autotags rules works with elfeed-protocol."
    (defvar elfeed-protocol-tags)
    (setq elfeed-protocol-tags elfeed-feeds)
    (setq elfeed-feeds (list
                        (list "ttrss+https://alrayyes@rss.higherlearning.eu"
                              :password (password-store-get "emacs/rss")
                              :autotags elfeed-protocol-tags)))))

(use-package! elfeed-org
  :config
  (setq rmh-elfeed-org-files '("~/Documents/org/elfeed.org"))
  )

(use-package! elfeed-goodies
  :config
  (elfeed-goodies/setup))

(with-eval-after-load "ispell"
    (setq ispell-program-name "hunspell")
    ;; ispell-set-spellchecker-params has to be called
    ;; before ispell-hunspell-add-multi-dic will work
    (ispell-set-spellchecker-params)
    (ispell-hunspell-add-multi-dic "en_GB,nl_NL,en_US")
    (setq ispell-dictionary "en_GB,nl_NL,en_US"))

(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))
