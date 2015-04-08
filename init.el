(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("f0b0710b7e1260ead8f7808b3ee13c3bb38d45564e369cbe15fc6d312f0cd7a0" "82bd95b23e7983161a77cc1e9fd66c2e5998f197ead810aac9ef76d13f3e26cb" default))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:background "dark slate gray" :foreground "gainsboro"))))
 '(company-tooltip-annotation ((t (:inherit company-tooltip :foreground "medium sea green"))))
 '(company-tooltip-selection ((t (:inherit company-tooltip :background "steel blue"))))
 '(popup-tip-face ((t (:background "dim gray" :foreground "white smoke")))))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-packages)
(require 'init-functions)

(require 'init-basic)
(require 'init-paths)
(require 'init-visual)

(require 'init-details)
(require 'init-kenobi)
(require 'init-helm)
(require 'init-ac)
(require 'init-paredit)
(require 'init-dired)


(require 'init-python)
(require 'init-R)
(require 'init-haskell)
(require 'init-sql)
(require 'init-js)
(require 'init-elisp)
(require 'init-md)
(require 'init-c)
(require 'init-org)
(require 'init-clojure)

(require 'init-keys)

(appt-activate t)
(bh/org-agenda-to-appt)
