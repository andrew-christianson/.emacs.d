(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)
(package-initialize)

;; Visal Basics
(require 'hlinum)
(hlinum-activate)
(global-hl-line-mode 1)

;; Get that cruft outta here
(menu-bar-mode nil)
(setq inhibit-startup-screen t)
(display-time-mode t)
(show-paren-mode t)
;; If called from Lisp, enable
;; Menu Bar mode if ARG is omitted or nil.
;; How's that for a sensible default...
(menu-bar-mode -1)
(scroll-bar-mode nil)
(tool-bar-mode nil)
(setf inhibit-splash-screen t)


(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path (if (eq system-type "windows-nt") ";" ":") (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))


(if (eq system-type 'windows-nt)
    (setq find-program "C:\\Users\\andrew.christianson\\GOOGLE~1\\Dropbox\\cmder\\vendor\\msysgit\\bin\\find.exe")
    )
(if (eq system-type 'windows-nt)
  (add-to-list 'exec-path "C:/Users/andrew.christianson/GOOGLE~1/Dropbox/cmder/gpg/pub")
  )

;; Tuhdo Customizations
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; My Custom Keymaps
(global-set-key (kbd "C-S-d") 'kill-whole-line)
(global-set-key (kbd "M-a") 'align)

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

(defun split-window-multiple-ways (x y)
  "Split the current frame into a grid of X columns and Y rows."
  (interactive "nColumns: \nnRows: ")
  ;; one window
  (delete-other-windows)
  (dotimes (i (1- x))
      (split-window-horizontally)
      (dotimes (j (1- y))
	(split-window-vertically))
      (other-window y))
  (dotimes (j (1- y))
    (split-window-vertically))
  (balance-windows))

(defun show-buffers-with-major-mode (mode)
  "Fill all windows of the current frame with buffers using major-mode MODE."
  (interactive
   (let* ((modes (loop for buf being the buffers
		       collect (symbol-name (with-current-buffer buf
					      major-mode)))))
     (list (intern (completing-read "Mode: " modes)))))
  (let ((buffers (loop for buf being the buffers
		       when (eq mode (with-current-buffer buf
				       major-mode))
		       collect buf)))
    (dolist (win (window-list))
      (when buffers
	(show-buffer win (car buffers))
	(setq buffers (cdr buffers))))))

; fetch the list of packages available 
;; (unless package-archive-contents
;;   (package-refresh-contents))

; install the missing packages
;; (dolist (package pack-list)		
;;   (unless (package-installed-p package)
;;     (package-install package)))

(require 'helm-config)
(require 'helm-eshell)
(require 'helm-projectile)
(require 'helm-descbinds)

(global-set-key (kbd "C-x C-b") 'ibuffer)
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h g") 'helm-google-suggest)

(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)
(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)

(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

(setq helm-split-window-in-side-p           0 ; open helm buffer
					      ; inside current window,
					      ; not occupy whole other
					      ; window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer
					      ; names when non--nil
      helm-recentf-fuzzy-match              t
      helm-move-to-line-cycle-in-source     t ; move to end or
					      ; beginning of source
					      ; when reaching top or
					      ; bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in
					      ; `require' and
					      ; `declare-function'
					      ; sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other
					      ; window using
					      ; M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

;; My Custom Keymaps
(global-set-key (kbd "C-S-d") 'kill-whole-line)
(global-set-key (kbd "M-a") 'align)

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


(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.
Move point to the first non-whitespace character on this line.
if point was already at that position, move point to beginning of line."
  (interactive)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(defun split-window-multiple-ways (x y)
  "Split the current frame into a grid of X columns and Y rows."
  (interactive "nColumns: \nnRows: ")
  ;; one window
  (delete-other-windows)
  (dotimes (i (1- x))
      (split-window-horizontally)
      (dotimes (j (1- y))
	(split-window-vertically))
      (other-window y))
  (dotimes (j (1- y))
    (split-window-vertically))
  (balance-windows))

(defun show-buffers-with-major-mode (mode)
  "Fill all windows of the current frame with buffers using major-mode MODE."
  (interactive
   (let* ((modes (loop for buf being the buffers
		       collect (symbol-name (with-current-buffer buf
					      major-mode)))))
     (list (intern (completing-read "Mode: " modes)))))
  (let ((buffers (loop for buf being the buffers
		       when (eq mode (with-current-buffer buf
				       major-mode))
		       collect buf)))
    (dolist (win (window-list))
      (when buffers
	(show-buffer win (car buffers))
	(setq buffers (cdr buffers))))))

(global-set-key (kbd "C-c d m g") 'split-window-multiple-ways)
(global-set-key (kbd "C-c d m t g") 'show-buffers-with-major-mode)
(global-set-key [home] 'smart-beginning-of-line)
(global-set-key "\C-a" 'smart-beginning-of-line)

(if (eq system-type 'darwin)
    (exec-path-from-shell-initialize)
  )


;; AutoComplete
;; Needed for autocomplete from ess
(require 'auto-complete-config)
(require 'ac-helm) ;; Not necessary if using ELPA package

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-delay 0.25
      ;; ac-quick-help-delay 0.1
      ac-auto-show-menu t
      ac-use-fuzzy t)

(define-key ac-completing-map (kbd "TAB") 'ac-complete)
(define-key ac-completing-map (kbd "C-h") 'ac-quick-help)

(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)

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
;; (require 'linum-mode)

(define-global-minor-mode my-global-linum-mode linum-mode
  (lambda ()
    (when (not (memq major-mode
                     (list 'doc-view-mode 'doc-view-minor-mode)))
      (linum-mode))))

(my-global-linum-mode 1)


;; (global-linum-mode 1)
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
(add-hook 'haskell-mode-hook 'turn-on-hi2)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c I ") 'haskell-navigate-imports))

(custom-set-variables '(haskell-tags-on-save t))

(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))
(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

(eval-after-load 'haskell-mode
  '(define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile))
(eval-after-load 'haskell-cabal
  '(define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile))

(require 'rainbow-delimiters)
(rainbow-delimiters-mode)

;; (custom-set-variables '(haskell-process-type 'cabal-repl))

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
(require 'sr-speedbar)
(global-set-key [f8] 'sr-speedbar-toggle)
;; (setq projectile-switch-project-action 'neotree-projectile-action)
;; (setq neo--persist-show nil)

;; Magit
;; Other custom Bindings

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
;; (setq mouse-wheel-follow-mouse 't)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

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
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(require 'org-agenda)
(setq org-agenda-span 14)

;; see http://www.gnu.org/software/emacs/manual/html_node/elisp/Face-Attributes.html
;; for details on font settis
;; weight controls the typeface for source code pro.

(if (or (eq system-type 'windows-nt)
	(eq system-type 'darwin))
    (set-face-attribute 'default nil
			:family "Source Code Pro"
			:height (if (eq system-type 'windows-nt) 90 110)
			:weight 'light
			:width 'normal
			:foundry 'outline
			:slant 'normal))

(if (eq system-type 'gnu/linux)
    (set-face-attribute 'default nil
			:family "DejaVu Sans Mono" 
			:foundry "unknown" 
			:slant 'normal 
			:weight 'normal 
			:height 90 
			:width 'normal))

;; Theme Settings


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482"
			      "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
)
;; Themes come after the safe marker
(load-theme 'spacegray t)
(sml/setup)
(sml/apply-theme 'respectful)
