(setq backup-directory-alist `(("." . "~/.saves"))
      ;; Autosave to home dir
      auto-save-file-name-transforms `((".*" ,"~/.saves" t))
      ;; No .# files - just be sure to only have one emacs server at a
      ;; time.
      create-lockfiles nil
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t
      redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1
      )
(setq org-mobile-directory "~/Dropbox/MobileOrg")
(add-hook 'before-save-hook 'delete-trailing-whitespace)
