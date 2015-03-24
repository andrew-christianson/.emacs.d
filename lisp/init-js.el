(add-to-list 'auto-mode-alist '("\\.js[x]?\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'\\|\\.jshintrc\\'" . json-mode))
(defun jsash ()
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript", "D3JS"))
  )
(add-hook 'js2-mode-hook 'jsash)

(provide 'init-js)
