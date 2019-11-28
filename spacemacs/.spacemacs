;; -*- mode: emacs-lisp -*-

;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default dotspacemacs-distribution 'spacemacs
                dotspacemacs-enable-lazy-installation
                'unused
                dotspacemacs-ask-for-lazy-installation
                t
                dotspacemacs-configuration-layer-path
                '()
                dotspacemacs-configuration-layers
                '(yaml javascript
                       csv
                       html
                       rust
                       helm
                       auto-completion
                       better-defaults
                       dash
                       emacs-lisp
                       git
                       (dash :variables helm-dash-docset-newpath
                             "~/.local/share/Zeal/docsets/" helm-dash-browser-func
                             'eww)
                       markdown
                       mu4e
                       org
                       (rcirc : variables
                              rcirc-enable-znc-support t)
                       semantic
                       shell-scripts
                       spotify
                       spell-checking
                       syntax-checking)
                dotspacemacs-additional-packages
                '(helm-ag pkgbuild-mode yasnippet-snippets)
                dotspacemacs-frozen-packages
                '()
                dotspacemacs-excluded-packages
                '()
                dotspacemacs-install-packages
                'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq-default dotspacemacs-elpa-https t
                dotspacemacs-elpa-timeout
                5
                dotspacemacs-check-for-update
                `t
                dotspacemacs-elpa-subdirectory
                nil
                dotspacemacs-editing-style
                'vim
                dotspacemacs-verbose-loading
                nil
                dotspacemacs-startup-banner
                'official
                dotspacemacs-startup-lists
                '((recents . 5)
                  (projects . 7))
                dotspacemacs-startup-buffer-responsive
                t
                dotspacemacs-scratch-mode
                'text-mode
                dotspacemacs-themes
                '(spacemacs-dark spacemacs-light)
                dotspacemacs-colorize-cursor-according-to-state
                t
                dotspacemacs-default-font
                '("FuraCode Nerd Font Mono" :size 13
                  :weight normal
                  :width normal
                  :powerline-scale 1.1)
                dotspacemacs-leader-key
                "SPC"
                dotspacemacs-emacs-command-key
                "SPC"
                dotspacemacs-ex-command-key
                ":"
                dotspacemacs-emacs-leader-key
                "M-m"
                dotspacemacs-major-mode-leader-key
                ","
                dotspacemacs-major-mode-emacs-leader-key
                "C-M-m"
                dotspacemacs-distinguish-gui-tab
                nil
                dotspacemacs-remap-Y-to-y$
                nil
                dotspacemacs-retain-visual-state-on-shift
                t
                dotspacemacs-visual-line-move-text
                nil
                dotspacemacs-ex-substitute-global
                nil
                dotspacemacs-default-layout-name
                "Default"
                dotspacemacs-display-default-layout
                nil
                dotspacemacs-auto-resume-layouts
                nil
                dotspacemacs-large-file-size
                1
                dotspacemacs-auto-save-file-location
                'cache
                dotspacemacs-max-rollback-slots
                5
                dotspacemacs-helm-resize
                nil
                dotspacemacs-helm-no-header
                nil
                dotspacemacs-helm-position
                'bottom
                dotspacemacs-helm-use-fuzzy
                'always
                dotspacemacs-enable-paste-transient-state
                nil
                dotspacemacs-which-key-delay
                0.4
                dotspacemacs-which-key-position
                'bottom
                dotspacemacs-loading-progress-bar
                t
                dotspacemacs-fullscreen-at-startup
                nil
                dotspacemacs-fullscreen-use-non-native
                nil
                dotspacemacs-maximized-at-startup
                nil
                dotspacemacs-active-transparency
                90
                dotspacemacs-inactive-transparency
                90
                dotspacemacs-show-transient-state-title
                t
                dotspacemacs-show-transient-state-color-guide
                t
                dotspacemacs-mode-line-unicode-symbols
                t
                dotspacemacs-smooth-scrolling
                t
                dotspacemacs-line-numbers
                't
                dotspacemacs-folding-method
                'evil
                dotspacemacs-smartparens-strict-mode
                nil
                dotspacemacs-smart-closing-parenthesis
                nil
                dotspacemacs-highlight-delimiters
                'all
                dotspacemacs-persistent-server
                nil
                dotspacemacs-search-tools
                '("ag" "pt" "ack" "grep")
                dotspacemacs-default-package-repository
                nil
                dotspacemacs-whitespace-cleanup
                nil))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first.")

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; rcirc
  (setq rcirc-server-alist '(("freenode.higherlearning.eu" :port "5000"
                              :encryption tls
                              :auth "l0rd/freenode")
                             ("snoonet.higherlearning.eu" :port "5000"
                              :encryption tls
                              :auth "l0rd/snoonet")))
  ;; mu4e
  (setq sendmail-program "/usr/bin/msmtp"
        send-mail-function
        'smtpmail-send-it
        message-sendmail-f-is-evil
        t
        message-sendmail-extra-arguments
        '("--read-envelope-from")
        message-send-mail-function
        'message-send-mail-with-sendmail)
  (with-eval-after-load 'mu4e-alert
    (mu4e-alert-set-default-style 'notifications))
  (with-eval-after-load 'mu4e-maildirs-extension
    (setq mu4e-maildirs-extension-custom-list '("/ryankes/INBOX" "/ryankes/Sent" "/ryankes/Drafts"
                                                "/ryankes/Archive" "/ryankes/Archive.quicknet"
                                                "/gmail/INBOX" "/gmail/Sent" "/gmail/Drafts"
                                                "/gmail/Archive" "/andthensome/INBOX" "/andthensome/Sent"
                                                "/andthensome/Drafts" "/andthensome/Archive")))
  (with-eval-after-load 'mu4e
    (setq mu4e-maildir "~/.local/share/mail"
          mu4e-maildir-shortcuts
          '(("/ryankes/INBOX" . ?r)
            ("/gmail/INBOX" . ?g)
            ("/andthensome/INBOX" . ?a))
          mu4e-update-interval
          300
          mu4e-get-mail-command
          "mailsync"
          mu4e-enable-mode-line
          t
          mu4e-use-fancy-chars
          t
          mu4e-view-show-images
          t
          mu4e-context-policy
          'pick-first
          mu4e-attachment-dir
          "~/Downloads/"
          mu4e-compose-context-policy
          nil
          mu4e-contexts
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
                                              (mu4e-refile-folder . "/andthensome/Archive")))))
    (add-hook 'mu4e-view-mode-hook 'visual-line-mode)))





;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7"
                            "#a31db1" "#28def0" "#b2b2b2"])
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages (quote (yasnippet-snippets stickyfunc-enhance srefactor
                                                        slack emojify circe oauth2 websocket darcula-theme
                                                        yaml-mode web-beautify livid-mode skewer-mode
                                                        simple-httpd json-mode json-snatcher json-reformat
                                                        js2-refactor multiple-cursors js2-mode js-doc
                                                        company-tern dash-functional tern coffee-mode
                                                        csv-mode web-mode tagedit slim-mode scss-mode
                                                        sass-mode pug-mode helm-css-scss haml-mode
                                                        emmet-mode company-web web-completion-data
                                                        toml-mode racer flycheck-rust cargo rust-mode
                                                        insert-shebang fish-mode company-shell zeal-at-point
                                                        helm-dash dash-docs spotify helm-spotify-plus
                                                        multi mu4e-maildirs-extension mu4e-alert ht
                                                        rcirc-notify rcirc-color powerline-theme pkgbuild-mode
                                                        unfill smeargle orgit org-projectile org-category-capture
                                                        org-present org-pomodoro alert log4e gntp
                                                        org-mime org-download mwim mmm-mode markdown-toc
                                                        markdown-mode magit-gitflow magit-popup htmlize
                                                        helm-gitignore helm-company helm-c-yasnippet
                                                        gnuplot gitignore-mode gitconfig-mode gitattributes-mode
                                                        git-timemachine git-messenger git-link gh-md
                                                        fuzzy flyspell-correct-helm flyspell-correct
                                                        flycheck-pos-tip pos-tip flycheck evil-magit
                                                        magit transient git-commit with-editor company-statistics
                                                        company auto-yasnippet yasnippet auto-dictionary
                                                        ac-ispell auto-complete ws-butler winum which-key
                                                        volatile-highlights vi-tilde-fringe uuidgen
                                                        use-package toc-org spaceline powerline restart-emacs
                                                        request rainbow-delimiters popwin persp-mode
                                                        pcre2el paradox spinner org-plus-contrib org-bullets
                                                        open-junk-file neotree move-text macrostep
                                                        lorem-ipsum linum-relative link-hint indent-guide
                                                        hydra lv hungry-delete hl-todo highlight-parentheses
                                                        highlight-numbers parent-mode highlight-indentation
                                                        helm-themes helm-swoop helm-projectile projectile
                                                        pkg-info epl helm-mode-manager helm-make helm-flx
                                                        helm-descbinds helm-ag google-translate golden-ratio
                                                        flx-ido flx fill-column-indicator fancy-battery
                                                        eyebrowse expand-region exec-path-from-shell
                                                        evil-visualstar evil-visual-mark-mode evil-unimpaired
                                                        evil-tutor evil-surround evil-search-highlight-persist
                                                        highlight evil-numbers evil-nerd-commenter
                                                        evil-mc evil-matchit evil-lisp-state smartparens
                                                        evil-indent-plus evil-iedit-state iedit evil-exchange
                                                        evil-escape evil-ediff evil-args evil-anzu
                                                        anzu evil goto-chg undo-tree eval-sexp-fu
                                                        elisp-slime-nav dumb-jump f dash s diminish
                                                        define-word column-enforce-mode clean-aindent-mode
                                                        bind-map bind-key auto-highlight-symbol auto-compile
                                                        packed aggressive-indent adaptive-wrap ace-window
                                                        ace-link ace-jump-helm-line helm avy helm-core
                                                        popup async)))
 '(paradox-github-token t)
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
