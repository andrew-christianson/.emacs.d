;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t)))
(eval-after-load 'elisp-slime-nav '(diminish 'elisp-slime-nav-mode))

(defun eldash ()
  (interactive)
  (setq-local helm-dash-docsets '("Emacs Lisp"))
  )
(add-hook 'elisp-mode-hook 'eldash)
