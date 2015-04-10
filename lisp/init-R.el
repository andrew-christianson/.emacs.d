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

;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

(provide 'init-R)
