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


(add-hook 'R-mode-hook 'flycheck-mode)
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
                                 (ess-R-fl-keyword:%op% . t)))
      ess-default-style 'RStudio)
(add-hook 'ess-mode-hook
          (lambda ()
            (setq ess-first-continued-statement-offset 2)
            (setq ess-continued-statement-offset 0)))
(defun guide-key/ess-guide-keys ()
  (guide-key/add-local-guide-key-sequence "C-c")
  )

(add-hook 'ess-mode-hook 'guide-key/ess-guide-keys)
;; (add-to-list 'ess-style-alist
;;              '(my-style (ess-indent-level . 4)
;;                         (ess-first-continued-statement-offset . 4)
;;                         ;; (ess-first-continued-statement-offset . 0)
;;                         (ess-continued-statement-offset . 0)
;;                         ;; (ess-continued-statement-offset . 4)
;;                         (ess-brace-offset . 0)
;;                         (ess-close-brace-offset . 0)
;;                         (ess-arg-function-offset . 4)
;;                         (ess-arg-function-offset-new-line . '(4))
;;                         (ess-expression-offset . 4)
;;                         (ess-else-offset . 0)))

;; (setq ess-default-style 'my-style)

(provide 'init-R)
