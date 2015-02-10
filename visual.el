(hlinum-activate)
(global-hl-line-mode 1)
(define-global-minor-mode my-global-linum-mode linum-mode
  (lambda ()
    (when (not (memq major-mode
                     (list 'doc-view-mode 'doc-view-minor-mode)))
      (linum-mode))))

(my-global-linum-mode 1)
;; (menu-bar-mode nil)
(setq inhibit-startup-screen t)
(display-time-mode t)
(show-paren-mode t)
;; If called from Lisp, enable
;; Menu Bar mode if ARG is omitted or nil.
;; How's that for a sensible default...
(menu-bar-mode -1)
(scroll-bar-mode nil)
(tool-bar-mode nil)
;; (setf inhibit-splash-screen t)

(show-paren-mode 1)
(rainbow-delimiters-mode)
(smartparens-global-mode)
(global-git-gutter-mode 1)
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines 1)

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
			:family "Source Code Pro for Powerline"
			:foundry 'outline
			:slant 'normal
			:weight 'medium
			:height 80
			:width 'normal))
(sml/setup)
(sml/apply-theme 'respectful)

(setq calendar-location-name "Los Angeles, CA")
(setq calendar-latitude 34.04)
(setq calendar-longitude -118.25)


(change-theme 'solarized-light 'solarized-dark)
