;; Ess

;; (setq inferior-ess-mode-hook
;;       '(ess-S-mouse-me-menu-commands
;; 	ess-developer-setup-modeline
;; 	turn-on-font-lock
;; 	smartparens-mode))
;; (add-hook 'R-mode-hook 'fci-mode)
(defun rdash ()
  (interactive)
  (setq-local helm-dash-docsets '("R"))
  )
(add-hook 'R-mode-hook 'rdash)
(add-hook 'ess-R-post-run-hook 'smartparens-mode)
(setq ess-R-font-lock-keywords (quote
                                ((ess-R-fl-keyword:modifiers . t)
                                 (ess-R-fl-keyword:fun-defs . t)
                                 (ess-R-fl-keyword:keywords . t)
                                 (ess-R-fl-keyword:assign-ops . t)
                                 (ess-R-fl-keyword:constants . t)
                                 (ess-fl-keyword:fun-calls . t)
                                 (ess-fl-keyword:numbers . t)
                                 (ess-fl-keyword:operators . t)
                                 (ess-fl-keyword:delimiters)
                                 (ess-fl-keyword:= . t)
                                 (ess-R-fl-keyword:F&T . t)
                                 (ess-R-fl-keyword:%op% . t))))
(provide 'init-R)
