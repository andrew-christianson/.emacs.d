(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "gtd.org") "Tasks")
             "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree (concat org-directory "journal.org"))
         "* %?\nEntered on %U\n  %i\n  %a")
        ("l" "Link" entry (file+headline (concat org-directory "links.org")
                                         ))))

(defun myorg-update-parent-cookie ()
  (when (equal major-mode 'org-mode)
    (save-excursion
      (ignore-errors
        (org-back-to-heading)
        (org-update-parent-todo-statistics)))))
(defadvice org-kill-line (after fix-cookies activate)
  (myorg-update-parent-cookie))
(defadvice kill-whole-line (after fix-cookies activate)
  (myorg-update-parent-cookie))

(setq org-default-notes-file (concat org-directory "notes.org"))

(provide 'init-org)
