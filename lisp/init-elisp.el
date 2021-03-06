;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(eval-after-load 'elisp-slime-nav '(diminish 'elisp-slime-nav-mode))

(defun eldash ()
  (interactive)
  (setq-local helm-dash-docsets '("Emacs Lisp"))
  )
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))
(add-hook 'emacs-lisp-mode-hook 'eldash)
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'flycheck-mode)
(add-hook 'emacs-lisp-mode-hook (lambda () (interactive) (smartparens-mode 0)))
(provide 'init-elisp)
