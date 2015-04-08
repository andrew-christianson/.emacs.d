(global-unset-key (kbd "C-z"))

;; Sublime Like Commenting

(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-M-;") 'recomment-region-or-line)

(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; My Custom Keymaps
(global-set-key (kbd "C-S-d") 'kill-whole-line)
(global-set-key (kbd "M-a") nil)
(global-set-key (kbd "M-a a") 'align)
(global-set-key (kbd "M-a s") 'align-regexp)

(global-set-key (kbd "C-c d m g") 'split-window-multiple-ways)
(global-set-key (kbd "C-c d m t g") 'show-buffers-with-major-mode)
(global-set-key [end] 'move-end-of-line)
(global-set-key [home] 'smart-beginning-of-line)
(global-set-key "\C-a" 'smart-beginning-of-line)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)


;; Magnar's

(global-set-key (kbd "C-x C-S-k") 'delete-current-buffer-file)
(global-set-key (kbd "C-x C-S-r") 'rename-current-buffer-file)

(global-set-key (kbd "<C-S-down>") 'move-line-down)
(global-set-key (kbd "<C-S-up>") 'move-line-up)

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

(global-set-key (kbd "M-j")
            (lambda ()
                  (interactive)
                  (join-line -1)))
(global-set-key (kbd "C-c w") 'whitespace-mode)
(global-set-key (kbd "<f5>")
		(lambda ()
		  (interactive)
		  (setq-local compilation-read-command nil)
		  (call-interactively 'compile)))

(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "M-<down>") 'move-line-down)

(global-set-key "\C-x~" 'set-80-columns)

;; ID: 6a3f3d99-f0da-329a-c01c-bb6b868f3239

(global-set-key (kbd "C-c r") 'insert-random)

(global-set-key (kbd "C-c e") 'eval-and-replace)

(global-set-key (kbd "s-x") 'launch)

;; Dictionary lookup

(autoload 'ispell-get-word "ispell")

(global-set-key (kbd "M-#") 'lookup-word)

;; (scratch-key (kbd "C-c s s") "*scratch*"    emacs-lisp-mode)
;; (scratch-key (kbd "C-c s d") "*javascript*" js2-mode)
;; (scratch-key (kbd "C-c s a") "*lisp*"       lisp-mode)
;; (scratch-key (kbd "C-c s c") "*clojure*"    clojure-mode)
;; (scratch-key (kbd "C-c s x") "*css*"        css-mode)
;; (scratch-key (kbd "C-c s h") "*html*"       html-mode)

;; ID: 72dc0a9e-c41c-31f8-c8f5-d9db8482de1e
;; Dedicated windows

(global-set-key [pause] 'toggle-current-window-dedication)

;;; Process menu killing

(define-key process-menu-mode-map "k" 'process-menu-kill)

;; pp

;; Help mode assistance

(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c h F") 'helm-flycheck))

(eval-after-load 'zygospore
  (global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows))

(global-set-key (kbd "s-f") 'er/expand-region)

(eval-after-load 'helm
  (lambda ()
    (interactive)
    (global-unset-key (kbd "C-x c"))

    (global-set-key (kbd "C-c h") 'helm-command-prefix)

    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
    (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
    (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

    (global-set-key (kbd "C-x b") 'helm-mini)
    (global-set-key (kbd "C-x C-f") 'helm-find-files)
    (global-set-key (kbd "M-y") 'helm-show-kill-ring)
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "C-x C-m") 'helm-M-x)
    (global-set-key (kbd "C-c h o") 'helm-occur)
    (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
    (global-set-key (kbd "C-c h g") 'helm-google-suggest)
    (global-set-key (kbd "C-c h P") 'helm-projectile)

    (define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)
    (define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)

    (global-set-key (kbd "C-h b") 'helm-descbinds)
    (global-set-key (kbd "C-c h d") 'helm-dash)))

(eval-after-load 'helm-gtags
  (lambda ()
    (interactive)
    (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
    (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
    (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
    (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
    (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
    (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)))

(eval-after-load 'multiple-cursors
  (lambda ()
    (interactive)
    (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
    (global-set-key (kbd "C->") 'mc/mark-next-like-this)
    (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
    (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)))

(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c I ") 'haskell-navigate-imports)
  (define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile)
  ;; (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  ;; (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  ;; (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  ;; (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  ;; (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
  ))

(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
  (define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile)
  ))
;; (define-prefix-command 'org-todo-state-map)

;;      (define-key org-mode-map "\C-cx" 'org-todo-state-map)

;;      (define-key org-todo-state-map "x"
;;        #'(lambda nil (interactive) (org-todo "CANCELLED")))
;;      (define-key org-todo-state-map "d"
;;        #'(lambda nil (interactive) (org-todo "DONE")))
;;      (define-key org-todo-state-map "f"
;;        #'(lambda nil (interactive) (org-todo "DEFERRED")))
;;      (define-key org-todo-state-map "l"
;;        #'(lambda nil (interactive) (org-todo "DELEGATED")))
;;      (define-key org-todo-state-map "s"
;;        #'(lambda nil (interactive) (org-todo "STARTED")))
;;      (define-key org-todo-state-map "w"
;;        #'(lambda nil (interactive) (org-todo "WAITING")))
(provide 'init-keys)
