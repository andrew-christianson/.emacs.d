(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-minimum-width 40)
 '(create-lockfiles nil)
 '(custom-safe-themes
   (quote
    ("0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "e56f1b1c1daec5dbddc50abd00fcd00f6ce4079f4a7f66052cf16d96412a09a9" "0f6e58d1814b4138c5a88241f96547d35883cbb3df6cf9ec8ef44856ece04c13" "26247bcb0b272ec9a5667a6b854125450c88a44248123a03d9f242fd5c6ec36f" "0f002f8b472e1a185dfee9e5e5299d3a8927b26b20340f10a8b48beb42b55102" "53e29ea3d0251198924328fd943d6ead860e9f47af8d22f0b764d11168455a8e" "9dae95cdbed1505d45322ef8b5aa90ccb6cb59e0ff26fef0b8f411dfc416c552" "4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" default)))
 '(fill-column 80)
 '(magit-use-overlays nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:background "dark slate gray" :foreground "gainsboro"))))
 '(company-tooltip-annotation ((t (:inherit company-tooltip :foreground "medium sea green"))))
 '(company-tooltip-selection ((t (:inherit company-tooltip :background "steel blue")))))

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
