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
