(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
        (next-line)))
(defun recomment-region-or-line ()
    "Comments then uncomments the region or the current line if there's no active region.  Corrects # to ## in ESS Mode"
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)
        (comment-or-uncomment-region beg end)))

(defun split-window-multiple-ways (x y)
  "Split the current frame into a grid of X columns and Y rows."
  (interactive "nColumns: \nnRows: ")
  ;; one window
  (delete-other-windows)
  (dotimes (i (1- x))
      (split-window-horizontally)
      (dotimes (j (1- y))
	(split-window-vertically))
      (other-window y))
  (dotimes (j (1- y))
    (split-window-vertically))
  (balance-windows))

(defun show-buffers-with-major-mode (mode)
  "Fill all windows of the current frame with buffers using major-mode MODE."
  (interactive
   (let* ((modes (loop for buf being the buffers
		       collect (symbol-name (with-current-buffer buf
					      major-mode)))))
     (list (intern (completing-read "Mode: " modes)))))
  (let ((buffers (loop for buf being the buffers
		       when (eq mode (with-current-buffer buf
				       major-mode))
		       collect buf)))
    (dolist (win (window-list))
      (when buffers
	(show-buffer win (car buffers))
	(setq buffers (cdr buffers))))))

(defun my-jedi-setup ()
  "Blah"
  (setq ac-sources '(ac-source-filename))
  (jedi:setup)
  (define-key jedi-mode-map (kbd "C-TAB") nil)
  (define-key jedi-mode-map (kbd "C-<tab>") nil)
  (define-key jedi-mode-map (kbd "C-S-c c") 'jedi:complete)
  )

(defun my-jedi-settings ()
  "Blah"
  (define-key python-mode-map (kbd "C-S-c c") 'jedi:complete)
  (setq jedi:complete-on-dot t
        jedi:tooltip-method nil)
  )

(defun my-flycheck-settings ()
  "Blah"
  (flycheck-mode 1)
  (flycheck-select-checker 'python-pylint)
  )

(defun smart-beginning-of-line (arg)
  "Move point to first non-whitespace character or beginning-of-line.
Move point to the first non-whitespace character on this line.
if point was already at that position, move point to beginning of line."
  (interactive "^p")
  (or arg (setq arg 1))
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))
    )
)


;; Magnar's Tweaks


(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))




(defun delete-current-buffer-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (ido-kill-buffer)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun fib (n)
  "Fibanacci sequence, slow implementation."
  (if (<= n 2) 1
    (+ (fib (- n 2)) (fib (- n 1)))))

(defun set-window-width (n)
  "Set the selected window's width."
  (adjust-window-trailing-edge (selected-window) (- n (window-width)) t))

(defun insert-random (n)
  "Insert a random number between 0 and the prefix argument."
  (interactive "P")
  (insert (number-to-string (random n))))

(defun eval-and-replace (value)
  "Evaluate the sexp at point and replace it with its value."
  (interactive (list (eval-last-sexp nil)))
  (kill-sexp -1)
  (insert (format "%S" value)))

(defun launch (command)
  "Launch an application from Emacs, with its own output
buffer. This is like asynch-shell-command but allows for any
number of processes at a time, rather than just one. If given a
prefix argument, the process's buffer is displayed."
  (interactive (list (read-shell-command (concat default-directory "$ "))))
  (let* ((name (car (split-string-and-unquote command)))
         (buffer (generate-new-buffer (concat "*" name "*"))))
    (set-process-sentinel (start-process-shell-command name buffer command)
                          'launch-sentinel)
    (if (eq (car current-prefix-arg) 4)
        (display-buffer buffer))))

(defun launch-sentinel (proc event)
  "Reports on changes in `launch'ed applications."
  (message (format "%s: %s" proc event)))

(defun lookup-word (word)
  (interactive (list (save-excursion (car (ispell-get-word nil)))))
  (browse-url (format "http://en.wiktionary.org/wiki/%s" word)))

(defun flash-region (start end &optional timeout)
  "Temporarily highlight region from START to END."
  (let ((overlay (make-overlay start end)))
    (overlay-put overlay 'face 'secondary-selection)
    (run-with-timer (or timeout 0.2) nil 'delete-overlay overlay)))

(defun slurp (file)
  "Return FILE contents as a string."
  (with-temp-buffer
    (insert-file-contents file)
    (buffer-string)))

(defun find-all-files (dir)
  "Open all files and sub-directories below the given directory."
  (interactive "DBase directory: ")
  (let* ((list (directory-files dir t "^[^.]"))
         (files (remove-if 'file-directory-p list))
         (dirs (remove-if-not 'file-directory-p list)))
    (dolist (file files)
      (find-file-noselect file))
    (dolist (dir dirs)
      (find-file-noselect dir)
      (find-all-files dir))))

(defun toggle-current-window-dedication ()
  (interactive)
  (let* ((window (selected-window))
         (dedicated (window-dedicated-p window)))
    (set-window-dedicated-p window (not dedicated))
    (message "Window %sdedicated to %s"
             (if dedicated "no longer " "")
             (buffer-name))))

(defun eval-buffer* (&optional buffer)
  "Like `eval-buffer', but obey `lexical-binding'. It does
everything the original function does, except for modifying
`load-history'."
  (interactive)
  (with-current-buffer (or buffer (current-buffer))
    (save-excursion
      (goto-char (point-min))
      (loop while (< (point) (point-max))
            for sexp = (condition-case e
                           (read (current-buffer))
                         (end-of-file nil))
            do (eval sexp lexical-binding)))
    (message "%S loaded" (current-buffer))))

(defun what-face (pos)
  "Show the name of face under point."
  (interactive "d")
  (let ((face (or (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))
    (if face (message "Face: %s" face) (message "No face at %d" pos))))

(defun eshell-as (name)
  "Start or find an eshell buffer named NAME and pop to it."
  (interactive (list (buffer-name)))
  (let* ((buffer-name (concat "*eshell " name "*"))
         (buffer (or (get-buffer buffer-name)
                     (save-window-excursion (eshell t)))))
    (pop-to-buffer buffer)
    (setf (buffer-name) buffer-name)
    buffer))

(defun process-menu-kill ()
  "Kill selected process in the process menu buffer."
  (interactive)
  (let ((process (get-text-property (point) 'tabulated-list-id)))
    (when (processp process) (kill-process process))
    (run-at-time 0.1 nil (lambda ()
                           (let ((n (line-number-at-pos)))
                             (revert-buffer)
                             (forward-line (1- n)))))))

(defun pp-macroexpand-all-last-sexp (arg)
  "Run `macroexpand-all' on sexp before point.
With argument, pretty-print output into current buffer.
Ignores leading comment characters."
  (interactive "P")
  (if arg
      (insert (pp-to-string (eval (pp-last-sexp))))
    (pp-display-expression (macroexpand-all (pp-last-sexp))
                           "*Pp Macroexpand Output*")))

(defun push-first-button ()
  "Find and push the first button in this buffer, intended for `help-mode'."
  (interactive)
  (block :find-button
    (goto-char (point-min))
    (while (< (point) (point-max))
      (if (get-text-property (point) 'button)
          (return-from :find-button (push-button))
        (forward-char)))))

(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (let* ((column (current-column))
         (start (progn (beginning-of-line) (point)))
         (end (progn (end-of-line) (forward-char) (point)))
         (line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    (forward-line -1)
    (forward-char column)))
(defmacro measure-time (&rest body)
  "Measure and return the running time of the code block."
  (declare (indent defun))
  (let ((start (make-symbol "start")))
    `(let ((,start (float-time)))
       ,@body
       (- (float-time) ,start))))

;; (defmacro scratch-key (key buffer-name mode)
;;   `(global-set-key ,key (lambda ()
;;                           (interactive)
;;                           (switch-to-buffer ,buffer-name)
;;                           (unless (eq major-mode ',mode)
;;                             (,mode)))))

(provide 'init-functions)
