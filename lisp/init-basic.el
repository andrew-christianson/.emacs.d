(defconst emacs-tmp-dir (format "%s%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist `((".*" . ,emacs-tmp-dir))
      auto-save-file-name-transforms `((".*" ,emacs-tmp-dir t))
      auto-save-list-file-prefix emacs-tmp-dir)

(setq create-lockfiles nil)
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)
(setq redisplay-dont-pause t)
(setq scroll-margin 2)
(setq scroll-step 0)
(setq scroll-conservatively 10000)
(setq scroll-preserve-screen-position 1)
(setq w32-get-true-file-attributes nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 4 spaces
(setq-default tab-width 4)

;; (if (not (eq system-type 'windows-nt) )
;;     (with-eval-after-load "persp-mode-autoloads"
;;       (setq wg-morph-on nil)
;;       ;; switch off the animation of restoring window configuration
;;       (global-set-key (kbd "M-p p") 'persp-keymap-prefix)
;;       (add-hook 'after-init-hook #'(lambda () (persp-mode 1)))))


(defalias 'yes-or-no-p 'y-or-n-p)

 ;; Auto refresh buffers

(global-auto-revert-mode 1)

(provide 'init-basic)
