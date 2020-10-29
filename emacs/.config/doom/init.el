;;; init.el -*- lexical-binding: t; -*-

;; Copy this file to ~/.doom.d/init.el or ~/.config/doom/init.el ('doom install'
;; will do this for you). The `doom!' block below controls what modules are
;; enabled and in what order they will be loaded. Remember to run 'doom refresh'
;; after modifying it.
;;
;; More information about these modules (and what flags they support) can be
;; found in modules/README.org.

(doom! :completion
       company           ; the ultimate code completion backend
       (ivy +icons)               ; a search engine for love and life

       :ui
       deft
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       modeline          ; snazzy, Atom-inspired modeline, plus API
       ;;nav-flash         ; blink the current line after jumping
       ophints           ; highlight the region an operation acts on
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       ligatures
       tabs
       treemacs          ; a project drawer, like neotree but cooler
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       (format +onsave +format-with-lsp)  ; automated prettiness
       ;multiple-cursors  ; editing in many places at once
       ;rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired +icons +ranger)
       electric
       (ibuffer +icons)
       vc
       (undo +tree)

       :term
       ;;eshell            ; a consistent, cross-platform shell (WIP)
       ;;shell             ; a terminal REPL for Emacs
       ;;term              ; terminals in Emacs
       ;;vterm             ; another terminals in Emacs

       :checkers
       syntax
       (spell +enchant +everywhere)
       grammar

       :tools
       biblio
       (docker +lsp)
       editorconfig
       (eval +overlay)
       lsp
       magit
       make
       pass
       pdf

       :lang
       (cc +lsp)
       data
       emacs-lisp
       (go +lsp)
       (hugo +ox-hugo)
       (javascript +lsp)
       ledger
       (markdown +grip)
       (org
        +noter
        +journal
        +roam
        +dragndrop
        +hugo
        +pandoc
        +pretty
        +present)
       (json +lsp)
       (php +lsp)
       (python +lsp)
       (rust +lsp)
       (sh +lsp +fish)
       (web +lsp)
       (yaml +lsp)

       :email
       mu4e

       :app
       calendar
       irc               ; how neckbeards socialize
       (rss +org)        ; emacs as an RSS reader

       :config
       literate
       (default +bindings +smartparens))
