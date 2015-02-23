;; Ess

;; (setq inferior-ess-mode-hook
;;       '(ess-S-mouse-me-menu-commands
;; 	ess-developer-setup-modeline
;; 	turn-on-font-lock
;; 	smartparens-mode))
(add-hook 'R-mode-hook 'fci-mode)
(add-hook 'ess-R-post-run-hook 'smartparens-mode)
