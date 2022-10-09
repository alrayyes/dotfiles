(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
(package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
  ;; "ensure" packages by default
  (setq use-package-always-ensure t)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(setq inhibit-startup-message t) ;; Disable startup message

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(menu-bar-mode -1)          ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type `relative)

(use-package doom-themes)
(load-theme 'doom-molokai t)

;; Default pitch face
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font")

;; Fixed pitch face
(set-face-attribute 'fixed-pitch  nil :font "JetBrainsMono Nerd Font")

;; Variable pitch face
(set-face-attribute 'variable-pitch  nil :font "Cantarell")

(use-package all-the-icons)

(use-package doom-modeline
:init (doom-modeline-mode 1)
:custom (doom-modeline-height 15))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(use-package evil
    :init      ;; tweak evil's configuration before loading it
    (setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
    (evil-mode))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package general
   :config
   (general-evil-setup t)

(general-create-definer dw/leader-key-def
   :keymaps '(normal insert visual emacs)
   :prefix "SPC"
   :global-prefix "C-SPC"))

(use-package which-key
  :init (which-key-mode)
:config(setq which-key-idle-delay 0.3))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1)) ;; Load keybindings

(use-package ivy-rich
:after counsel
    :init
  (ivy-rich-mode 1))

(use-package counsel
  :demand t
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ;; ("C-M-j" . counsel-switch-buffer)
         ("C-M-l" . counsel-imenu)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (setq ivy-initial-inputs-alist nil)) ;; Don't start searches with ^

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  (setq projectile-project-search-path '("~/devel/" "~/dotfiles/" "~/Documents/"))
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

(use-package counsel-projectile
:after projectile
:config
(counsel-projectile-mode))

(use-package magit)

(defun efs/org-mode-setup ()
    (org-indent-mode)
    (variable-pitch-mode 1)
    (visual-line-mode 1))

    (use-package org
  :hook
(org-mode . efs/org-mode-setup)
:config
  (setq org-ellipsis " ▾"))

(use-package org-bullets
  :hook
(org-bullets-mode t))

(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "Cantarell" :weight 'regular :height (cdr face)))

;; Ensure that anything that should be fixed-pitch in Org files appears that way
(set-face-attribute 'org-block nil    :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil    :inherit 'fixed-pitch)
(set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil     :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil    :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil  :inherit 'fixed-pitch)
(set-face-attribute 'line-number nil :inherit 'fixed-pitch)
(set-face-attribute 'line-number-current-line nil :inherit 'fixed-pitch)

(defun efs/org-mode-visual-fill ()
  (setq visual-fill-column-width 120
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . efs/org-mode-visual-fill))

(setq
org-agenda-files (directory-files-recursively "~/Documents/org/" "\.org$"))

(with-eval-after-load 'org
  (org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
      (python . t)))

  (push '("conf-unix" . conf-unix) org-src-lang-modes))

(with-eval-after-load 'org
  ;; This is needed as of Org 9.2
  (require 'org-tempo)

  (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
  (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("py" . "src python"))
  (add-to-list 'org-structure-template-alist '("ph" . "src php")))
