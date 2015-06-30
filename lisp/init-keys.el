
(global-unset-key (kbd "C-z"))

;; Sublime Like Commenting

(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-M-;") 'recomment-region-or-line)

(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; My Custom Keymaps

(global-set-key (kbd "C-c d") 'kill-whole-line-repeatable)
(global-set-key (kbd "M-a") nil)
(global-set-key (kbd "M-a a") 'align)
(global-set-key (kbd "M-a s") 'align-regexp)

(global-set-key (kbd "C-x 7 1") 'split-window-multiple-ways)
(global-set-key (kbd "C-x 7 b") 'show-buffers-with-major-mode)
(global-set-key [end] 'move-end-of-line)
(global-set-key [home] 'smart-beginning-of-line)
(global-set-key (kbd "C-a") 'smart-beginning-of-line)

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

;; ID: 6a3f3d99-f0da-329a-c01c-bb6b868f3239

(global-set-key (kbd "C-c r") 'insert-random)

(global-set-key (kbd "C-c e") 'eval-and-replace)

(global-set-key (kbd "C-x x") 'launch)

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

;; Help mode assistance

(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c h F") 'helm-flycheck))

(eval-after-load 'zygospore
  '(global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows))

(eval-after-load 'expand-region
  '(global-set-key (kbd "C-c SPC") 'er/expand-region))

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
    (global-set-key (kbd "C-c h i") 'helm-semantic-or-imenu)
    (global-set-key (kbd "C-c h /") 'helm-find)
    (global-set-key (kbd "C-c h l") 'helm-locate)
    (global-set-key (kbd "C-c h m") 'helm-man-woman)
    (global-set-key (kbd "C-c h a") 'helm-apropos)
    (global-set-key (kbd "C-c h b") 'helm-resume)
    (global-set-key (kbd "M-x") 'helm-M-x)
    (global-set-key (kbd "C-x C-m") 'helm-M-x)
    (global-set-key (kbd "C-c h o") 'helm-occur)
    (global-set-key (kbd "C-c h SPC") 'helm-all-mark-rings)
    (global-set-key (kbd "C-c h g") 'helm-google-suggest)
    (global-set-key (kbd "C-c h P") 'helm-projectile)
    (global-set-key (kbd "C-c h r") 'helm-regexp)
    (global-set-key (kbd "C-c h x") 'helm-register)
    (global-set-key (kbd "C-c h t") 'helm-top)

    (global-set-key (kbd "C-c h M-:") 'helm-eval-expression-with-eldoc)
    (global-set-key (kbd "C-h b") 'helm-descbinds)
    (global-set-key (kbd "C-c h d") 'helm-dash)
    (global-set-key (kbd "C-c h s") 'helm-surfraw)
    (global-set-key (kbd "C-c h c") 'helm-color)
    (global-set-key (kbd "C-c h C") 'helm-calcul-expression)

    ;; helm for history EVERYWHERE
    (add-hook 'eshell-mode-hook
              #'(lambda ()
                  (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))
    (define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)
    (define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)
    (define-key inferior-ess-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)
    )
  )


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
    (global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)))

(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c I ") 'haskell-navigate-imports)
  (define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
  ))

(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)
  (define-key haskell-cabal-mode-map (kbd "C-c C-o") 'haskell-compile)
  ))

(eval-after-load 'jedi
  '(progn
     (define-key jedi-mode-map (kbd "C-TAB") nil)
     (define-key jedi-mode-map (kbd "C-<tab>") nil)
     (define-key jedi-mode-map (kbd "C-S-c c") 'jedi:complete)))
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

;; ace-jump

;;
;; ace jump mode major function
;;
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-S-s") 'ace-jump-mode)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(define-key global-map (kbd "C-x C-SPC") 'ace-jump-mode-pop-mark)

(global-set-key (kbd "C-x C-g") 'magit-status)

(setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "M-p p" "C-c h" "C-c p" "C-x 5" "C-c g")
      guide-key/popup-window-position 'bottom
      guide-key/recursive-key-sequence-flag t
      guide-key/guide-buffer-name "guide-keys")
(guide-key-mode 1)

(provide 'init-keys)
