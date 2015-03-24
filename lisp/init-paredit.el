;; making paredit work with delete-selection-mode
;; (put 'paredit-forward-delete 'delete-selection 'supersede)
;; (put 'paredit-backward-delete 'delete-selection 'supersede)
;; (put 'paredit-open-round 'delete-selection t)
;; (put 'paredit-open-square 'delete-selection t)
;; (put 'paredit-doublequote 'delete-selection t)
;; (put 'paredit-newline 'delete-selection t)



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
(defun kill-my-comment-key ()
  (define-key paredit-mode-map (kbd "M-;") nil))
(add-hook 'paredit-mode-hook 'kill-my-comment-key)

(provide 'init-paredit)
