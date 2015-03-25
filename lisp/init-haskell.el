(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-hi2)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook 'flycheck-mode)

(add-to-list 'completion-ignored-extensions ".hi")

(defun haskdash ()
  (interactive)
  (setq-local helm-dash-docsets '("Haskell"))
  )
(add-hook 'haskell-mode-hook 'haskdash)
(provide 'init-haskell)
