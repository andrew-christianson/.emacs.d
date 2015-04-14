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
      jedi:tooltip-method '(pos-tip)
      jedi:get-in-function-call-delay 125
      jedi:get-in-function-call-timeout 10000
      flycheck-checker-error-threshold 10000
      pymacs-load-path '("~/.emacs.d/rope"
                         "~/.emacs.d/ropemacs"
                         "~/.emacs.d/ropemode")
      )

(defun load-ropemacs ()
  "Load pymacs and ropemacs"
  (interactive)
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-")
  ;; Automatically save project python buffers before refactorings
  (setq ropemacs-confirm-saving nil
        ropemacs-enable-autoimport t
        ropemacs-guess-project t
        )
  (ropemacs-mode)
  )


(defun pydash ()
  (interactive)
  (setq-local helm-dash-docsets '("Python 2" "Python 3" "NumPy" "SciPy"))
  )
(add-hook 'python-mode-hook 'pydash)
(add-hook 'python-mode-hook 'my-flycheck-settings)
;; (add-hook 'python-mode-hook 'indent-guide-mode)
;; (add-hook 'python-mode-hook 'load-ropemacs)

(add-hook 'python-mode-local-vars-hook 'setup-jedi-extra-args)
(add-hook 'python-mode-local-vars-hook 'my-jedi-setup)
(add-hook 'python-mode-local-vars-hook 'setup-flycheck-venv)
(add-hook 'python-mode-local-vars-hook 'setup-virtualenv-path)

(provide 'init-python)
