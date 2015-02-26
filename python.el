(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args ""
      python-shell-prompt-regexp "In \[[0-9]+\]\: "
      python-shell-prompt-output-regexp "Out\[[0-9]*\]\: "
      python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))"
      python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))"
      python-shell-completion-native-enable (if (eq system-type "windows-nt") nil t)

      jedi:complete-on-dot t
      jedi:setup-keys t
      jedi:tooltip-method 'popup
      jedi:get-in-function-call-delay 250
      flycheck-checker-error-threshold 2000
      highlight-indent-face
      )
(add-hook 'python-mode-hook 'my-flycheck-settings)
(add-hook 'python-mode-hook 'fci-mode)
(add-hook 'python-mode-hook 'highlight-indentation-mode)


 ;; (add-hook 'python-mode-hook 'indent-guide-mode)
(add-hook 'python-mode-local-vars-hook 'setup-jedi-extra-args)
(add-hook 'python-mode-local-vars-hook 'my-jedi-setup)
(add-hook 'python-mode-local-vars-hook 'setup-flycheck-venv)
(add-hook 'python-mode-local-vars-hook 'setup-virtualenv-path)
