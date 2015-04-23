(setq backup-directory-alist `(("." . "~/.saves"))
      ;; Autosave to home dir
      auto-save-file-name-transforms `((".*" "~/.autosaves" t))
)

(setq create-lockfiles nil)
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)
(setq redisplay-dont-pause t)
(setq scroll-margin 10)
(setq scroll-step 0)
(setq scroll-conservatively 10000)
(setq scroll-preserve-screen-position 1)
(setq w32-get-true-file-attributes nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defalias 'yes-or-no-p 'y-or-n-p)

 ;; Auto refresh buffers

(global-auto-revert-mode 1)

(provide 'init-basic)
