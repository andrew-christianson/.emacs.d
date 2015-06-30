(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(add-hook 'scala-mode-hook (lambda () (auto-complete-mode 0)))

(provide 'init-scala)
