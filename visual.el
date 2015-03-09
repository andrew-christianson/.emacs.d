(hlinum-activate)
(global-hl-line-mode 1)


; don't blink the cursor
(blink-cursor-mode nil)

(define-global-minor-mode my-global-linum-mode linum-mode
  (lambda ()
    (when (not (memq major-mode
                     (list 'doc-view-mode 'doc-view-minor-mode)))
      (linum-mode))))
(my-global-linum-mode t)

(setq inhibit-startup-screen t)
(display-time-mode t)
(show-paren-mode t)
;; (menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(show-paren-mode 1)

(global-git-gutter-mode 1)
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines 1)
(setq require-final-newline t)
(setq ring-bell-function 'ignore)
(fringe-mode 4)

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
			:family "Droid Sans Mono"
			:slant 'normal
			:weight 'medium
			:height 90
			:width 'normal
			))

(setq calendar-location-name "Los Angeles, CA")
(setq calendar-latitude 34.04)
(setq calendar-longitude -118.25)
(change-theme 'my-spolsky 'my-spolsky)

;; (set-face-background hl-line-face "darkslategrey")
;; (set-face-background 'fringe "gray15")
(smartparens-global-mode)
