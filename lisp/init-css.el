(defun cssdash ()
  (interactive)
  (setq-local helm-dash-docsets '("CSS" "Bootstrap" "Bootstrap 3"))
  )
(add-hook 'css-mode-hook 'cssdash)
(add-hook 'css-mode-hook 'skewer-css-mode)


(provide 'init-css)
