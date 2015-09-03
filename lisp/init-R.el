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
(add-hook 'R-mode-hook 'flycheck-mode)
(add-hook 'ess-mode-hook '(lambda () (guide-key/add-local-guide-key-sequence "C-c")))
;; (add-hook 'ess-mode-hook
;;           (lambda ()
;;             (setq ess-first-continued-statement-offset 2)
;;             (setq ess-continued-statement-offset 0)))

;;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))

;;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))
(add-to-list 'ess-style-alist
             '(my-RStudio
               (ess-indent-offset . 4)
               (ess-offset-arguments . open-delim)
               (ess-offset-arguments-newline . prev-line)
               (ess-offset-block . prev-line)
               (ess-offset-continued . straight)
               (ess-align-declaration-args . t)
               (ess-align-nested-calls . nil)
               (ess-align-continuations-in-calls . nil)
               (ess-align-blocks . nil)
               (ess-indent-prev-call-lhs . t)
               (ess-indent-prev-call-chains . t)
               (ess-indent-with-fancy-comments . nil)))

(setq ess-roxy-template-alist '(("description" . " headline ")
                               ("details" . " details ")
                               ;; ("title" . "")
                               ("param" . "")
                               ;; ("return" . "")
                               ;; ("author" . "Andrew Christianson")
                               ))

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
      ess-default-style 'my-RStudio
      )

(provide 'init-R)
