(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-minimum-width 40)
 '(create-lockfiles nil)
 '(custom-safe-themes
   (quote
    ("53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:background "dark slate gray" :foreground "gainsboro"))) t)
 '(company-tooltip-annotation ((t (:inherit company-tooltip :foreground "medium sea green"))))
 '(company-tooltip-selection ((t (:inherit company-tooltip :background "steel blue"))) t))

(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/functions.el")

(load-file "~/.emacs.d/basic.el")
(load-file "~/.emacs.d/paths.el")
(load-file "~/.emacs.d/visual.el")
(load-file "~/.emacs.d/keys.el")

(load-file "~/.emacs.d/details.el")
(load-file "~/.emacs.d/kenobi.el")
(load-file "~/.emacs.d/helm.el")
(load-file "~/.emacs.d/ac.el")

(load-file "~/.emacs.d/python.el")
(load-file "~/.emacs.d/R.el")
(load-file "~/.emacs.d/haskell.el")
(load-file "~/.emacs.d/sql.el")
(load-file "~/.emacs.d/js.el")
(load-file "~/.emacs.d/md.el")
