(defun htmldash ()
  (interactive)
  (setq-local helm-dash-docsets '("HTML"))
  )
(add-hook 'html-mode-hook 'htmldash)
(add-hook 'html-mode-hook 'skewer-html-mode)

(provide 'init-html)
