(global-unset-key (kbd "C-z"))

;; Sublime Like Commenting

(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-M-;") 'recomment-region-or-line)

(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; My Custom Keymaps
(global-set-key (kbd "C-D") 'kill-whole-line)
(global-set-key (kbd "M-a") 'align)

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

(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c h F") 'helm-flycheck))
(eval-after-load 'zygospore
  (global-set-key (kbd "C-x 1") 'zygospore-toggle-delete-other-windows))
(eval-after-load 'expand-region
  (global-set-key (kbd "s-f") 'er/expand-region))
(eval-after-load 'helm
  (lambda ()
    (interactive)
    (global-set-key (kbd "C-h b") 'helm-descbinds)
    (global-set-key (kbd "C-x C-m") 'helm-M-x)
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
