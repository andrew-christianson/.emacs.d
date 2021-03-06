(if window-system
    (if (or (eq system-type 'darwin)
            (eq system-type 'gnu/linux))
        (exec-path-from-shell-initialize)
    )
  )

(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path (if (eq system-type "windows-nt") ";" ":") (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))


(if (eq system-type 'windows-nt)
    (setq find-program "\\mingw\\msys\\1.0\\bin\\find.exe"))

(if (eq system-type 'windows-nt)
  (add-to-list 'exec-path "\\Users\\andrew.christianson\\Dropbox\\cmder\\gpg\\pub"))

(if (eq system-type 'window-nt)
    (setq magit-git-executable "\\PROGRA~2\\Git\\bin\\git.exe"
          git-executable "\\PROGRA~2\\Git\\bin\\git.exe"))

(if (eq system-type 'windows-nt)
    (setq ispell-program-name "C:\\aspell\\bin\\aspell.exe"))

(provide 'init-paths)
