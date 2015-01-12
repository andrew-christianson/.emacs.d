(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)
(package-initialize)

(load-file "details.el")
(load-file "functions.el")

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



(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-M-;") 'recomment-region-or-line)



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

(global-set-key (kbd "M-SPC") 'set-mark-command)
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
(global-set-key (kbd "C-c h P") 'helm-projectile)

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
      ; ac-quick-help-delay 0.
      ac-auto-show-menu t
      ac-use-fuzzy t
      ac-show-menu-immediately-on-auto-complete t
      ac-candidate-limit 100
      ac-menu-height 25)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-minimum-width 40)
 '(custom-safe-themes (quote ("756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default))))

;; Themes come after the safe marker
(load-theme 'solarized-light t)
(sml/setup)
(sml/apply-theme 'respectful)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:background "dark slate gray" :foreground "gainsboro"))) t)
 '(company-tooltip-annotation ((t (:inherit company-tooltip :foreground "medium sea green"))))
 '(company-tooltip-selection ((t (:inherit company-tooltip :background "steel blue"))) t))
