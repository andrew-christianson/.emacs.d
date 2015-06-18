(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'\\|\\.jshintrc\\'" . json-mode))
(defun jsdash ()
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript" "D3JS" "jQuery" "NodeJS" "EmberJS"))
  )
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js2-mode-hook 'jsdash)
;; (add-hook 'js2-mode-hook 'skewer-mode)

(add-hook 'js-mode-hook
          (lambda () (flycheck-mode t)))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(setq tern-ac-on-dot t)

(provide 'init-js)
