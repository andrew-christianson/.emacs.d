(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-verbatim-environments (quote ("verbatim" "verbatim*" "lstlisting")))
 '(create-lockfiles nil)
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "6dcfb00a5fb759f216db8a382917d32453712a4ba52035cd800640d32a46cfab" "ffa2802f1dc63125ac385a4327c039186367180b112b0cc86e0ef99859c41066" "2d7e4feac4eeef3f0610bf6b155f613f372b056a2caae30a361947eab5074716" "e56f1b1c1daec5dbddc50abd00fcd00f6ce4079f4a7f66052cf16d96412a09a9" "aa2672c9bff3c5d16290e0e4df8237f53f008ee8d7b1950fc2fa99656898ea26" "f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "82bd95b23e7983161a77cc1e9fd66c2e5998f197ead810aac9ef76d13f3e26cb" default)))
 '(persp-keymap-prefix [134217840 112]))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-packages)
(require 'init-functions)

(require 'init-basic)
(require 'init-smart-parens)
(require 'init-paths)

(require 'init-details)
(require 'init-kenobi)
(require 'init-helm)
(require 'init-ac)
(require 'init-company)
(require 'init-paredit)
(require 'init-dired)


(require 'init-python)
(require 'init-R)
(require 'init-haskell)
(require 'init-sql)
(require 'init-elisp)
(require 'init-md)
(require 'init-c)
(require 'init-org)
(require 'init-clojure)
(require 'init-scala)
(require 'init-web)
(require 'init-latex)
(require 'init-keys)
(require 'init-visual)
(require 'windcycle)

(appt-activate t)
(bh/org-agenda-to-appt)
