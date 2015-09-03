(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-verbatim-environments (quote ("verbatim" "verbatim*" "lstlisting")))
 '(create-lockfiles nil)
 '(custom-safe-themes
   (quote
    ("3ed645b3c08080a43a2a15e5768b893c27f6a02ca3282576e3bc09f3d9fa3aaa" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "8288b9b453cdd2398339a9fd0cec94105bc5ca79b86695bd7bf0381b1fbe8147" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "08851585c86abcf44bb1232bced2ae13bc9f6323aeda71adfa3791d6e7fea2b6" "afc220610bee26945b7c750b0cca03775a8b73c27fdca81a586a0a62d45bbce2" "b9183de9666c3a16a7ffa7faaa8e9941b8d0ab50f9aaba1ca49f2f3aec7e3be9" "42089e9dfe41a491e48b05c31b6f1851abf4e5a704951bb55cd0e44186937cbb" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "726dd9a188747664fbbff1cd9ab3c29a3f690a7b861f6e6a1c64462b64b306de" "001240593e0c4d5322cbf44da17d5987618809acf22f60c0d22a0dc71971a0f2" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "6dcfb00a5fb759f216db8a382917d32453712a4ba52035cd800640d32a46cfab" "ffa2802f1dc63125ac385a4327c039186367180b112b0cc86e0ef99859c41066" "2d7e4feac4eeef3f0610bf6b155f613f372b056a2caae30a361947eab5074716" "e56f1b1c1daec5dbddc50abd00fcd00f6ce4079f4a7f66052cf16d96412a09a9" "aa2672c9bff3c5d16290e0e4df8237f53f008ee8d7b1950fc2fa99656898ea26" "f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "82bd95b23e7983161a77cc1e9fd66c2e5998f197ead810aac9ef76d13f3e26cb" default)))
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
