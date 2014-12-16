(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;; (setq pack-list `(undo-tree undo-tree ac-anaconda dash anaconda-mode f dash s dash json-rpc auto-complete popup ac-cider auto-complete popup cider queue pkg-info epl dash clojure-mode ac-etags auto-complete popup ac-js2 skewer-mode js2-mode simple-httpd js2-mode ac-math math-symbol-lists auto-complete popup ac-octave auto-complete popup ac-slime slime auto-complete popup afternoon-theme ample-theme ample-zen-theme assemblage-theme auctex-lua auto-complete-auctex auto-complete popup yasnippet auto-complete-exuberant-ctags auto-complete popup auto-complete-rst auto-complete popup badger-theme bliss-theme boron-theme bubbleberry-theme chess cider queue pkg-info epl dash clojure-mode circe lcs lui tracking shorten clojure-mode clojure-snippets yasnippet color-theme-approximate color-theme-buffer-local color-theme-sanityinc-tomorrow color-theme-solarized color-theme company-anaconda anaconda-mode f dash s dash json-rpc company cyberpunk-theme darkburn-theme darkmine-theme dirtree windata tree-mode dockerfile-mode elpy yasnippet pyvenv idomenu highlight-indentation find-file-in-project company ess-R-data-view ess popup ctable ess-R-object-popup ess popup ess-smart-underscore ess exec-path-from-shell find-file-in-project flatland-black-theme flatland-theme flycheck-haskell dash haskell-mode flycheck pkg-info epl dash flycheck-rust dash flycheck pkg-info epl dash fuzzy git-gutter-fringe fringe-helper git-gutter gratuitous-dark-theme haskell-mode helm-google google helm async helm-j-cheatsheet helm async helm-projectile projectile pkg-info epl dash f dash s s helm async helm-projectile-all s dash projectile pkg-info epl dash f dash s s helm async helm-spotify multi helm async highlight-indentation idomenu json-mode json-snatcher json-reformat json-reformat json-rpc json-snatcher julia-mode lcs lui tracking shorten magit git-rebase-mode git-commit-mode markdown-mode+ markdown-mode markdown-toc markdown-mode dash s math-symbol-lists minimal-theme molokai-theme monokai-theme multi multiple-cursors neotree noctilux-theme org-ac yaxception log4e auto-complete-pcmp yaxception log4e auto-complete popup org-jekyll org org-journal org-outlook pandoc-mode paredit-everywhere paredit popup projectile pkg-info epl dash f dash s s pyenv-mode pyvenv queue readline-complete skewer-mode js2-mode simple-httpd slime smart-mode-line-powerline-theme smart-mode-line rich-minority dash powerline smartparens dash smooth-scrolling subatomic-theme sublime-themes tracking shorten tree-mode twilight-theme underwater-theme windata workgroups2 f dash s anaphora dash yascroll yasnippet yaxception zen-and-art-theme zonokai-theme))
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(package-initialize)

(if (eq system-type 'windows-nt)
    (setq find-program "C:\\Users\\andrew.christianson\\GOOGLE~1\\Dropbox\\cmder\\vendor\\msysgit\\bin\\find.exe")
    )
; fetch the list of packages available 
;; (unless package-archive-contents
;;   (package-refresh-contents))

; install the missing packages
;; (dolist (package pack-list)		
;;   (unless (package-installed-p package)
;;     (package-install package)))

(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(helm-mode 1)

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-x") 'helm-M-x)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           0 ; open helm buffer inside current window, not occupy whole other window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

; (helm-mode 1)

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.
Move point to the first non-whitespace character on this line.
If point was already at that position, move point to beginning of line."
  (interactive)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))
(global-set-key [home] 'smart-beginning-of-line)
(global-set-key "\C-a" 'smart-beginning-of-line)

(if (eq system-type 'darwin)
    (exec-path-from-shell-initialize)
  )


;; AC
;; Needed for autocomplete from ess
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-delay 0.1
      ;; ac-quick-help-delay 0.1
      ac-auto-show-menu t
      ac-use-fuzzy t)
(define-key ac-completing-map (kbd "TAB") 'ac-complete)
(define-key ac-completing-map (kbd "C-h") 'ac-quick-help)
(global-auto-complete-mode)


;; Company
;(require 'company)
;(global-company-mode 0) 

;; Ess
(require 'ess-site)
(require 'ess-smart-underscore)
(if (eq system-type 'windows-nt)
    (setq inferior-julia-program-name "~/../julia/Julia-0.3.2/bin/julia")
)

;; SmartParen
(require 'smartparens-config)
(smartparens-global-mode)


;; undotree:
;(require 'undo-tree)
;(global-undo-tree-mode)
;; Paredit
;; (add-hook 'prog-mode-hook 'paredit-everywhere-mode)

;; MultiCursor
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Linum settings
(global-linum-mode 1)
;; (setq linum-format "%4d\u2502")


;; Python
(if (eq system-type 'darwin)
    (pyenv-mode)
  )
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-to-list 'company-backends 'company-anaconda)
;; (add-hook 'python-mode-hook 'eldoc-mode)
(elpy-enable)
(elpy-use-ipython)
(setq elpy-rpc-backend "jedi")

;; OME Grab
(show-paren-mode 1)
;; (setq show-paren-style 'expression)
;;(global-yascroll-bar-mode 1)

;; Markdown
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
;; (add-to-list 'align-rules-list
             ;; '(haskell-types
               ;; (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
               ;; (modes quote (haskell-mode literate-haskell-mode))))
;; (add-to-list 'align-rules-list
             ;; '(haskell-assignment
               ;; (regexp . "\\(\\s-+\\)=\\s-+")
               ;; (modes quote (haskell-mode literate-haskell-mode))))
;; (add-to-list 'align-rules-list
             ;; '(haskell-arrows
               ;; (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
               ;; (modes quote (haskell-mode literate-haskell-mode))))
;; (add-to-list 'align-rules-list
             ;; '(haskell-left-arrows
               ;; (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
               ;; (modes quote (haskell-mode literate-haskell-mode))))
;; Javascript

(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'\\|\\.jshintrc\\'" . json-mode))

;; Projectile
(projectile-global-mode)

;; dirtree
;; (require 'dirtree)

;; NeoTree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;; (setq projectile-switch-project-action 'neotree-projectile-action)
(setq neo-persist-show nil)

;; Magit
;; Other custom Bindings
(global-set-key (kbd "C-S-d") 'kill-whole-line)
(global-set-key (kbd "M-a") 'align)
;; Backups
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Smooth scrolling
;; due to http://stackoverflow.com/a/4160949/881025
;; Works well on OSX 10.10
(require 'smooth-scrolling)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;(setq redisplay-dont-pause t
;  scroll-margin 1
;  scroll-step 1
;  scroll-conservatively 10000
;  scroll-preserve-screen-position 1)

;; (require 'workgroups2)
;; ;<prefix> <key>
;; ;<prefix> c    - create workgroup
;; ;<prefix> A    - rename workgroup
;; ;<prefix> k    - kill workgroup
;; ;<prefix> v    - switch to workgroup
;; ;<prefix> C-s  - save session
;; ;<prefix> C-f  - load session

;; (setq wg-prefix-key (kbd "C-c z"))

;; ;; Change workgroups session file
;; (setq wg-session-file "~/.emacs.d/.emacs_workgroups")

;; ;; Set your own keyboard shortcuts to reload/save/switch WGs:
;; ;; "s" == "Super" or "Win"-key, "S" == Shift, "C" == Control
;; (global-set-key (kbd "<pause>")     'wg-reload-session)
;; (global-set-key (kbd "C-S-<pause>") 'wg-save-session)
;; (global-set-key (kbd "s-z")         'wg-switch-to-workgroup)
;; (global-set-key (kbd "s-/")         'wg-switch-to-previous-workgroup)
;; ;; What to do on Emacs exit / workgroups-mode exit?
;; (setq wg-emacs-exit-save-behavior           'ask)      ; Options: 'save 'ask nil
;; (setq wg-workgroups-mode-exit-save-behavior 'save)      ; Options: 'save 'ask nil

;; ;; Mode Line changes
;; ;; Display workgroups in Mode Line?
;; (setq wg-mode-line-display-on t)          ; Default: (not (featurep 'powerline))
;; (setq wg-flag-modified t)                 ; Display modified flags as well
;; (setq wg-mode-line-decor-left-brace "["
;;       wg-mode-line-decor-right-brace "]"  ; how to surround it
;;       wg-mode-line-decor-divider ":")
;; (workgroups-mode 1)

;; Sublime Like Commenting
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
        (next-line)))
(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)

(if (eq system-type 'window-nt)
     (setq magit-git-executable "c:/PROGRA~2/Git/bin/git.exe")
)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(require 'git-gutter-fringe)

(global-git-gutter-mode 1)
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines 1)


;; Org Mode

(setq org-mobile-directory "~/Dropbox/MobileOrg")
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(require 'org-agenda)
(setq org-agenda-span 14)

;; see http://www.gnu.org/software/emacs/manual/html_node/elisp/Face-Attributes.html
;; for details on font settis
;; weight controls the typeface for source code pro.
(set-face-attribute 'default nil
		    :family "Source Code Pro"
		    :height (if (eq system-type 'windows-nt) 90 110)
		    :weight 'light
		    :width 'normal
		    :foundry 'outline
		    :slant 'normal)

;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(default ((t (:family "Source Code Pro"
			;; :foundry "outline"
			;; :slant normal
			;; :weight light
			;; :height '
			;; :width normal)))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
 '(display-time-mode t)
 '(flymake-no-changes-timeout 0.1)
 '(show-paren-mode t))

;; Theme Settings
(load-theme 'monokai t)

;; Powerline
;; After the set-faces s.t. it hopefully takes effectc
(sml/setup)
(sml/apply-theme 'respectful)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
