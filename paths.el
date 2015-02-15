(if (or (eq system-type 'darwin)
	(eq system-type 'gnu/linux))
    (exec-path-from-shell-initialize)
  )
(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path (if (eq system-type "windows-nt") ";" ":") (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(if (eq system-type 'windows-nt)
    (setq inferior-julia-program-name "~/../julia/Julia-0.3.2/bin/julia")
  )


(if (eq system-type 'windows-nt)
    (setq find-program "C:\\Users\\andrew.christianson\\GOOGLE~1\\Dropbox\\cmder\\vendor\\msysgit\\bin\\find.exe")
    )
(if (eq system-type 'windows-nt)
  (add-to-list 'exec-path "C:/Users/andrew.christianson/GOOGLE~1/Dropbox/cmder/gpg/pub")
  )
(if (eq system-type 'window-nt)
    (setq magit-git-executable "c:/PROGRA~2/Git/bin/git.exe"
	  git-executable "c:/PROGRA~2/Git/bin/git.exe")
     )
