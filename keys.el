(global-unset-key (kbd "C-z"))

;; Sublime Like Commenting

(global-set-key (kbd "M-;") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-M-;") 'recomment-region-or-line)

(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; My Custom Keymaps
(global-set-key (kbd "C-S-d") 'kill-whole-line)
(global-set-key (kbd "M-a") 'align)

(global-set-key (kbd "C-c d m g") 'split-window-multiple-ways)
(global-set-key (kbd "C-c d m t g") 'show-buffers-with-major-mode)
(global-set-key [home] 'smart-beginning-of-line)
(global-set-key "\C-a" 'smart-beginning-of-line)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c h F") 'helm-flycheck))

;; (require 'flycheck-tip)
;; (define-key flycheck-mode-map (kbd "C-M-S-n") 'flycheck-tip-cycle)
;; (define-key flycheck-mode-map (kbd "C-M-S-p") 'flycheck-tip-cycle-reverse)

(global-set-key (kbd "s-b") 'sr-speedbar-toggle)
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
