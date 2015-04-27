(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'\\|\\.jshintrc\\'" . json-mode))
(defun jsdash ()
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript" "D3JS" "jQuery" "NodeJS" "EmberJS"))
  )
(add-hook 'js2-mode-hook 'jsdash)
(add-hook 'js2-mode-hook 'skewer-mode)


(provide 'init-js)
