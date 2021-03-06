;; making paredit work with delete-selection-mode

(defun paredit--is-at-start-of-sexp ()
  (and (looking-at "(\\|\\[")
       (not (nth 3 (syntax-ppss))) ;; inside string
       (not (nth 4 (syntax-ppss))))) ;; inside comment

(defun paredit-duplicate-closest-sexp ()
  (interactive)
  ;; skips to start of current sexp
  (while (not (paredit--is-at-start-of-sexp))
    (paredit-backward))
  (set-mark-command nil)
  ;; while we find sexps we move forward on the line
  (while (and (bounds-of-thing-at-point 'sexp)
              (<= (point) (car (bounds-of-thing-at-point 'sexp)))
              (not (= (point) (line-end-position))))
    (forward-sexp)
    (while (looking-at " ")
      (forward-char)))
  (kill-ring-save (mark) (point))
  ;; go to the next line and copy the sexprs we encountered
  (paredit-newline)
  (yank)
  (exchange-point-and-mark))



(defun paredit-wrap-round-from-behind ()
  (interactive)
  (forward-sexp -1)
  (paredit-wrap-round)
  (insert " ")
  (forward-char -1))

(define-key paredit-mode-map (kbd "M-)")
  'paredit-wrap-round-from-behind)


 ;; This keeps the standard mapping, but serves as a reference for me.
(define-key paredit-mode-map (kbd "C-<right>") nil)
(define-key paredit-mode-map (kbd "C-<left>") nil)
(define-key paredit-mode-map (kbd "C-M-<right>") nil)
(define-key paredit-mode-map (kbd "C-M-<left>") nil)

(define-key paredit-mode-map (kbd "C-<right>") 'paredit-forward-slurp-sexp)
(define-key paredit-mode-map (kbd "C-<left>") 'paredit-forward-barf-sexp)
(define-key paredit-mode-map (kbd "C-M-<right>") 'paredit-backward-slurp-sexp)
(define-key paredit-mode-map (kbd "C-M-<left>") 'paredit-backward-barf-sexp)

(define-key paredit-mode-map (kbd "M-C-<backspace>") 'backward-kill-sexp)

(defun dont-kill-my-keys ()
  (define-key paredit-mode-map (kbd "M-;") nil)
  (define-key paredit-mode-map (kbd "C-S-d") nil))


(add-hook 'paredit-mode-hook 'dont-kill-my-keys)
(add-hook 'paredit-mode-hook '(lambda ()
                                (put 'paredit-forward-delete 'delete-selection t)
                                (put 'paredit-backward-delete 'delete-selection t)
                                ;; (put 'paredit-open-round 'delete-selection t)
                                ;; (put 'paredit-open-square 'delete-selection t)
                                ;; (put 'paredit-doublequote 'delete-selection t)
                                (put 'paredit-newline 'delete-selection t)
                                (delete-selection-mode)))

(provide 'init-paredit)
