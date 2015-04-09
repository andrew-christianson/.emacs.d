(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

(setq helm-split-window-in-side-p           0 ; open helm buffer
					      ; inside current window,
					      ; not occupy whole other
					      ; window
      helm-buffers-fuzzy-matching           t ; fuzzy matching buffer
					      ; names when non--nil
      helm-recentf-fuzzy-match              t
      helm-move-to-line-cycle-in-source     t ; move to end or
					      ; beginning of source
					      ; when reaching top or
					      ; bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in
					      ; `require' and
					      ; `declare-function'
					      ; sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other
					      ; window using
					      ; M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-gtags-prefix-key "\C-cg")

(require 'helm-gtags)
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
(helm-mode 1)

(projectile-global-mode)
(setq projectile-indexing-method 'native
      projectile-enable-caching t
      projectile-completion-system 'helm)
(helm-projectile-on)


(provide 'init-helm)
