;; Make dired less verbose
(require 'dired-details)
(require 'dired+)
(require 'dired-sort)
(setq-default diredp-hide-details-initially-flag nil
              dired-dwim-target t)
(eval-after-load 'dired
  (lambda () (interactive)
            (require 'dired+)
            (require 'dired-sort)
            (when (fboundp 'global-dired-hide-details-mode)
              (global-dired-hide-details-mode -1))
            (setq dired-recursive-deletes 'top)
            (define-key dired-mode-map [mouse-2] 'dired-find-file)
            (add-hook 'dired-mode-hook
                      (lambda () (guide-key/add-local-guide-key-sequence "%")))))

(setq-default dired-details-hidden-string "--- ")
(dired-details-install)


;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(provide 'init-dired)
