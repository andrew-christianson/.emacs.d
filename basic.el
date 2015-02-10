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
      version-control t)
(setq org-mobile-directory "~/Dropbox/MobileOrg")
