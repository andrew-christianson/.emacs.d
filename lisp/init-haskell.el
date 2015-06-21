(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

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

(setq haskell-process-suggest-remove-import-lines t
      haskell-process-auto-import-loaded-modules t
      haskell-process-log t
      haskell-tags-on-save t
      haskell-process-type 'cabal-repl
      company-ghc-show-info t)

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)

; (add-to-list 'company-backends 'company-ghc)

(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-hook 'haskell-mode-hook '(progn
                                (auto-complete-mode nil)
                                (company-mode 1)
                                ))


(provide 'init-haskell)
