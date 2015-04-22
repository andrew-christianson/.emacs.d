(add-hook 'hack-local-variables-hook 'run-local-vars-mode-hook)
(defun run-local-vars-mode-hook ()
  "Run a hook for the major-mode after the local variables have been processed."
  (run-hooks (intern (concat (symbol-name major-mode) "-local-vars-hook"))))


;; (defun detect_buffer_venv (buffer-name)

;;   (let ((buffer-dir (file-name-directory buffer-name)))

;;     (while (and (or (not (file-exists-p
;;                       (concat buffer-dir "bin/activate"))))
;;                 buffer-dir)
;;       (setq buffer-dir
;;         (if (equal buffer-dir "/")
;;             nil
;;             (file-name-directory (directory-file-name buffer-dir))
;;             ))
;;       )
;;     ;; return the buffer-dir (or nil)
;;     buffer-dir
;;     )
;;   )

;; (defun detect_buffer_venv (buffer-name)

;;   (let ((buffer-dir (file-name-directory buffer-name))
;;         (venv-exec-dir (if (eq system-type 'windows-nt) "Scripts" "bin")))
;;     ;; Also detect any virtualenvs in .venv* directories
;;     (while (or
;;             buffer-dir
;;             (not
;;              (or (equal buffer-dir nil)
;;                  (file-exists-p (concat buffer-dir venv-exec-dir "/" "activate"))
;;                  (file-expand-wildcards (concat buffer-dir ".venv*")))))
;;       (setq buffer-dir
;;             (if (equal buffer-dir "/")
;;                 nil
;;               (file-name-directory (directory-file-name buffer-dir))))
;;       )
;;     ;; return the buffer-dir (or nil)
;;     (if (file-exists-p (concat buffer-dir venv-exec-dir "/" "activate"))
;;         buffer-dir
;;       (if (file-exists-p (car (file-expand-wildcards (concat buffer-dir ".venv*"))))
;;           (car (file-expand-wildcards (concat buffer-dir ".venv*")))
;;         buffer-dir
;;         ))
;;     )
;;   )

(defun norm-path (path)
  (if (eq system-type 'windows-nt)
      (subst-char-in-string ?/ ?\\ path)
    path))

(defun detect_buffer_venv (buffer-name)
  (let ((buffer-dir (file-name-directory buffer-name))
        (venv-exec-dir (if (eq system-type 'windows-nt) "Scripts" "bin"))
        (not-found t)
        )

    (while not-found
      (if (or (file-exists-p (concat buffer-dir venv-exec-dir "/activate"))
              (file-expand-wildcards (concat buffer-dir ".venv*")))
          (setq not-found nil)
        (if (not
             (equal (file-name-directory (directory-file-name buffer-dir)) buffer-dir)) ;hit the top
            (setq buffer-dir (file-name-directory (directory-file-name buffer-dir)))
          (setq not-found nil
                buffer-dir nil)
          )))
    (if (equal buffer-dir nil)
        buffer-dir
        (if (file-exists-p (concat buffer-dir venv-exec-dir "/" "activate"))
            (norm-path buffer-dir)
          (if (file-exists-p (car (file-expand-wildcards (concat buffer-dir ".venv*"))))
              (norm-path (car (file-expand-wildcards (concat buffer-dir ".venv*"))))
            (norm-path buffer-dir))))
    )
  )


;; (norm-path "a/b/c")

(defun detect_buffer_eggs_dirs (buffer-name)
  (let ((buffer-dir (file-name-directory buffer-name))
        (venv-exec-dir (if (eq system-type 'windows-nt) "Scripts" "bin"))
        (not-found t))

    (while not-found
      (if  (file-exists-p (concat buffer-dir "eggs"))
          (setq not-found nil)
        (if (not
             (equal (file-name-directory (directory-file-name buffer-dir)) buffer-dir)) ;hit the top
            (setq buffer-dir (file-name-directory (directory-file-name buffer-dir)))
          (setq not-found nil
                buffer-dir nil))))

    (if (equal buffer-dir nil)
        buffer-dir
      (directory-files (concat buffer-dir "eggs") t ".\.egg"))
    )
  )

(setq additional_paths nil)

(defun setup-jedi-extra-args ()
  (let (
        (venv (detect_buffer_venv buffer-file-name))
        (egg-dirs (detect_buffer_eggs_dirs buffer-file-name))
        )
    (make-local-variable 'jedi:server-args)

    (when venv (set 'jedi:server-args (list "--virtual-env" venv)))
    (when egg-dirs
      (dolist (egg egg-dirs)
        (set 'jedi:server-args (append jedi:server-args (list "--sys-path" egg))))
      )
    )
  (make-local-variable 'additional_paths)
  (when additional_paths
    (dolist (path additional_paths)
      (set 'jedi:server-args (append jedi:server-args (list "--sys-path" path)))
      ))
  )

(defun setup-flycheck-execs ()
  (setq-local flycheck-python-pylint-executable (executable-find "pylint"))
  (setq-local flycheck-python-flake8-executable (executable-find "flake8"))
  )

(defun setup-flycheck-venv ()
  (let (
        (venv (detect_buffer_venv buffer-file-name))
        )
    (if venv
        (let* (
              (venv-exec-dir (if (eq system-type 'windows-nt) "Scripts" "bin"))
              (exec-path (cons (concat venv venv-exec-dir) exec-path))
              )
          (setup-flycheck-execs)
          )
      (setup-flycheck-execs)
      )
    )
  )



(defun setup-virtualenv-path ()
  (let (
        (venv (detect_buffer_venv buffer-file-name))
        )
    (if venv
        (setq-local python-shell-virtualenv-path venv)
      )
    )
  )

(provide 'init-kenobi)
