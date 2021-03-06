(defun cldash ()
  (interactive)
  (setq-local helm-dash-docsets '("Clojure"))
  )

(require 'cider)
;; (require 'ac-cider)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nrepl with Clojure
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq nrepl-popup-stacktraces nil)
;; (setq )
;; (eval-after-load 'cider
;;   (lambda () (interactive)
;;     (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
;;     (add-hook 'cider-mode-hook 'ac-cider-setup)
;;     (eval-after-load 'auto-complete
;;                 '(add-to-list 'ac-modes 'cider-repl-mode))
;;     (add-hook 'cider-repl-mode-hook 'set-auto-complete-as-completion-at-point-function)
;;     (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)
;;     (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
;;     (add-hook 'cider-repl-mode-hook 'subword-mode)
;;     (add-hook 'cider-repl-mode-hook 'paredit-mode)
;;     (define-key cider-mode-map (kbd "C-c C-d") 'ac-cider-popup-doc)
;;     ;; nrepl isn't based on comint
;;     (add-hook 'cider-repl-mode-hook
;;               (lambda () (setq show-trailing-whitespace nil)))))

(require 'flycheck-clojure)
(eval-after-load 'flycheck
            (flycheck-clojure-setup))

(add-hook 'clojure-mode-hook 'cldash)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook (lambda () (interactive) (smartparens-mode 0)))
(add-hook 'cider-repl-mode-hook #'paredit-mode)

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)

(add-hook 'cider-repl-mode-hook (lambda () (interactive) (auto-complete-mode 0)))
(add-hook 'cider-mode-hook (lambda () (interactive) (auto-complete-mode 0)))

(provide 'init-clojure)
