;; Vars
(require 'init-abbrevs)
(setq
 org-directory "~/Dropbox/org/"
 org-mobile-directory "~/Dropbox/org/mobile/")


(setq ispell-dictionary  "english")

(setq
 org-mobile-inbox-for-pull (concat org-directory "inbox.org")
 org-default-notes-file (concat org-directory "notes/" "notes.org")
 org-agenda-files (list (concat org-directory "agendas")
                        (concat org-directory "inbox.org")
                        (concat org-directory "journal.org")
                        (concat org-directory "shopping.org")
                        (concat org-directory "notes/" "ideas.org")
                        (concat org-directory "notes")
                        (concat org-directory "notes" "/" "books")))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

;; (setq org-todo-keyword-faces
;;       (quote (("TODO" :foreground "red" :weight bold)
;;               ("NEXT" :foreground "blue" :weight bold)
;;               ("DONE" :foreground "forest green" :weight bold)
;;               ("WAITING" :foreground "orange" :weight bold)
;;               ("HOLD" :foreground "magenta" :weight bold)
;;               ("CANCELLED" :foreground "forest green" :weight bold)
;;               ("MEETING" :foreground "forest green" :weight bold)
;;               ("PHONE" :foreground "forest green" :weight bold))))
(defun guide-key/my-hook-function-for-org-mode ()
  (guide-key/add-local-guide-key-sequence "C-c")
  (guide-key/add-local-guide-key-sequence "C-c C-x")
  (guide-key/add-local-highlight-command-regexp "org-"))
(add-hook 'org-mode-hook 'guide-key/my-hook-function-for-org-mode)
(setq org-use-fast-todo-selection t)

(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Dropbox/org/inbox.org")
               "* TODO %?\n%U" :clock-in t :clock-resume t)
              ("r" "respond" entry (file "~/Dropbox/org/inbox.org")
               "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U"
               :clock-in t :clock-resume t :immediate-finish t)
              ("n" "note" entry (file "~/Dropbox/org/inbox.org")
               "* %? :NOTE:\n%U" :clock-in t :clock-resume t)
              ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
               "* %?\n%U\n" :clock-in t :clock-resume t)
              ("g" "Groccery" entry (file+datetree "~/Dropbox/org/shopping.org")
               "* TODO %?\n%U\n" :clock-in t :clock-resume t)
              ("w" "org-protocol" entry (file "~/Dropbox/org/inbox.org")
               "* TODO Review %c\n%U\n" :immediate-finish t)
              ("m" "Meeting" entry (file "~/Dropbox/org/inbox.org")
               "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
              ("p" "Phone call" entry (file "~/Dropbox/org/inbox.org")
               "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
              ("h" "Habit" entry (file "~/Dropbox/org/inbox.org")
               "* NEXT %?\n%USCHEDULED: %(format-time-string \"<%Y-%m-%d %a .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

; Use IDO for both buffer and file completion and ido-everywhere to t
;; (setq org-completion-use-ido t)
;; (setq ido-everywhere t)
;; (setq ido-max-directory-size 100000)
;; (ido-mode (quote both))
; Use the current window when visiting files and buffers with ido
;; (setq ido-default-file-method 'selected-window)
;; (setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)


(setq org-refile-target-verify-function 'bh/verify-refile-target)

;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t)))
              ("h" "Habits" tags-todo "STYLE=\"habit\""
               ((org-agenda-overriding-header "Habits")
                (org-agenda-sorting-strategy
                 '(todo-state-down effort-up category-keep))))
              (" " "Agenda"
               ((agenda "" nil)
                (tags "REFILE"
                      ((org-agenda-overriding-header "Tasks to Refile")
                       (org-tags-match-list-sublevels nil)))
                (tags-todo "-CANCELLED/!"
                           ((org-agenda-overriding-header "Stuck Projects")
                            (org-agenda-skip-function 'bh/skip-non-stuck-projects)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-HOLD-CANCELLED/!"
                           ((org-agenda-overriding-header "Projects")
                            (org-agenda-skip-function 'bh/skip-non-projects)
                            (org-tags-match-list-sublevels 'indented)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED/!NEXT"
                           ((org-agenda-overriding-header
                             (concat "Project Next Tasks"
                                     (if bh/hide-scheduled-and-waiting-next-tasks
                                         ""
                                       " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function
                             'bh/skip-projects-and-habits-and-single-tasks)
                            (org-tags-match-list-sublevels t)
                            (org-agenda-todo-ignore-scheduled
                             bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines
                             bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date
                             bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(todo-state-down effort-up category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header
                             (concat "Project Subtasks"
                                     (if bh/hide-scheduled-and-waiting-next-tasks
                                         ""
                                       " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function
                             'bh/skip-non-project-tasks)
                            (org-agenda-todo-ignore-scheduled
                             bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines
                             bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date
                             bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                           ((org-agenda-overriding-header
                             (concat "Standalone Tasks"
                                     (if bh/hide-scheduled-and-waiting-next-tasks
                                         ""
                                       " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-project-tasks)
                            (org-agenda-todo-ignore-scheduled
                             bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines
                             bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-with-date
                             bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-sorting-strategy
                             '(category-keep))))
                (tags-todo "-CANCELLED+WAITING|HOLD/!"
                           ((org-agenda-overriding-header
                             (concat "Waiting and Postponed Tasks"
                                     (if bh/hide-scheduled-and-waiting-next-tasks
                                         ""
                                       " (including WAITING and SCHEDULED tasks)")))
                            (org-agenda-skip-function 'bh/skip-non-tasks)
                            (org-tags-match-list-sublevels nil)
                            (org-agenda-todo-ignore-scheduled
                             bh/hide-scheduled-and-waiting-next-tasks)
                            (org-agenda-todo-ignore-deadlines
                             bh/hide-scheduled-and-waiting-next-tasks)))
                (tags "-REFILE/"
                      ((org-agenda-overriding-header "Tasks to Archive")
                       (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                       (org-tags-match-list-sublevels nil))))
               nil))))

(setq org-agenda-auto-exclude-function 'bh/org-auto-exclude-function)

;;
;; Resume clocking task when emacs is restarted
(org-clock-persistence-insinuate)
;;
;; Show lot of clocking history so it's easy to pick items off the C-F11 list
(setq org-clock-history-length 23)
;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)
;; Change tasks to NEXT when clocking in
(setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
;; Separate drawers for clocking and logs
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
;; Save clock data and state changes and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)
;; Clock out when moving task to a done state
(setq org-clock-out-when-done t)
;; Save the running clock and all clock history when exiting Emacs, load it on startup
(setq org-clock-persist t)
;; Do not prompt to resume an active clock
(setq org-clock-persist-query-resume nil)
;; Enable auto clock resolution for finding open clocks
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
;; Include current clocking task in clock reports
(setq org-clock-report-include-clocking-task t)

(setq bh/keep-clock-running nil)
(setq org-time-stamp-rounding-minutes (quote (1 1)))

(setq org-agenda-clock-consistency-checks
      (quote (:max-duration "4:00"
              :min-duration 0
              :max-gap 0
              :gap-ok-around ("4:00"))))

;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Agenda clock report parameters
(setq org-agenda-clockreport-parameter-plist
      (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))

; Set default column view headings: Task Effort Clock_Summary
(setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")

; global Effort estimate values
; global STYLE property values for completion
(setq org-global-properties
      (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
              ("STYLE_ALL" . "habit"))))

;; Agenda log mode items to display (closed and state changes by default)
(setq org-agenda-log-mode-items (quote (closed state)))

; Tags with fast selection keys
(setq org-tag-alist (quote ((:startgroup)
                            ("@errand" . ?e)
                            ("@office" . ?o)
                            ("@home" . ?H)
                            ("@farm" . ?f)
                            (:endgroup)
                            ("WAITING" . ?w)
                            ("HOLD" . ?h)
                            ("PERSONAL" . ?P)
                            ("WORK" . ?W)
                            ("ORG" . ?O)
                            ("IPSOS" . ?I)
                            ("CONSULTING" . ?C)
                            ("crypt" . ?E)
                            ("NOTE" . ?n)
                            ("CANCELLED" . ?c)
                            ("FLAGGED" . ??))))

; Allow setting single tags without the menu
(setq org-fast-tag-selection-single-key (quote expert))

; For tag searches ignore tasks with scheduled and deadline dates
(setq org-agenda-tags-todo-honor-ignore-options t)
(setq org-agenda-span 'day)

(setq org-stuck-projects (quote ("" nil nil "")))


(setq org-archive-mark-done nil)
(setq org-archive-location "%s_archive::* Archived Tasks")

(setq org-alphabetical-lists t)
(setq org-ditaa-jar-path "~/Dropbox/org/ditaa.jar")
(setq org-plantuml-jar-path "~/Dropbox/org/plantuml.jar")
(setq org-babel-results-keyword "results")

(org-babel-do-load-languages
 (quote org-babel-load-languages)
 (quote ((emacs-lisp . t)
         (dot . t)
         (ditaa . t)
         (R . t)
         (python . t)
         (ruby . t)
         (gnuplot . t)
         (clojure . t)
         (sh . t)
         (ledger . t)
         (org . t)
         (plantuml . t)
         (latex . t))))

; Do not prompt to confirm evaluation
; This may be dangerous - make sure you understand the consequences
; of setting this -- see the docstring for details
(setq org-confirm-babel-evaluate nil)

; Use fundamental mode when editing plantuml blocks with C-c '
(add-to-list 'org-src-lang-modes (quote ("plantuml" . fundamental)))

;; Don't enable this because it breaks access to emacs from my Android phone
(setq org-startup-with-inline-images nil)

; experimenting with docbook exports - not finished
(setq org-export-docbook-xsl-fo-proc-command "fop %s %s")
(setq org-export-docbook-xslt-proc-command
      "xsltproc --output %s /usr/share/xml/docbook/stylesheet/nwalsh/fo/docbook.xsl %s")
;
; Inline images in HTML instead of producting links to the image
(setq org-html-inline-images t)
; Do not use sub or superscripts - I currently don't need this functionality in my documents
(setq org-export-with-sub-superscripts nil)
; Use org.css from the norang website for export document stylesheets
(setq org-html-head-extra
      "<link rel=\"stylesheet\" href=\"http://doc.norang.ca/org.css\" type=\"text/css\" />")
(setq org-html-head-include-default-style nil)
; Do not generate internal css formatting for HTML exports
(setq org-export-htmlize-output-type (quote css))
; Export with LaTeX fragments
(setq org-export-with-LaTeX-fragments t)
; Increase default number of headings to export
(setq org-export-headline-levels 6)

; List of projects
; norang       - http://www.norang.ca/
; doc          - http://doc.norang.ca/
; org-mode-doc - http://doc.norang.ca/org-mode.html and associated files
; org          - miscellaneous todo lists for publishing
;; (setq org-publish-project-alist
;;       ;
;;       ; http://www.norang.ca/  (norang website)
;;       ; norang-org are the org-files that generate the content
;;       ; norang-extra are images and css files that need to be included
;;       ; norang is the top-level project that gets published
;;       (quote (("norang-org"
;;                :base-directory "~/git/www.norang.ca"
;;                :publishing-directory "/ssh:www-data@www:~/www.norang.ca/htdocs"
;;                :recursive t
;;                :table-of-contents nil
;;                :base-extension "org"
;;                :publishing-function org-html-publish-to-html
;;                :style-include-default nil
;;                :section-numbers nil
;;                :table-of-contents nil
;;                :html-head "<link rel=\"stylesheet\" href=\"norang.css\" type=\"text/css\" />"
;;                :author-info nil
;;                :creator-info nil)
;;               ("norang-extra"
;;                :base-directory "~/git/www.norang.ca/"
;;                :publishing-directory "/ssh:www-data@www:~/www.norang.ca/htdocs"
;;                :base-extension "css\\|pdf\\|png\\|jpg\\|gif"
;;                :publishing-function org-publish-attachment
;;                :recursive t
;;                :author nil)
;;               ("norang"
;;                :components ("norang-org" "norang-extra"))
;;               ;
;;               ; http://doc.norang.ca/  (norang website)
;;               ; doc-org are the org-files that generate the content
;;               ; doc-extra are images and css files that need to be included
;;               ; doc is the top-level project that gets published
;;               ("doc-org"
;;                :base-directory "~/git/doc.norang.ca/"
;;                :publishing-directory "/ssh:www-data@www:~/doc.norang.ca/htdocs"
;;                :recursive nil
;;                :section-numbers nil
;;                :table-of-contents nil
;;                :base-extension "org"
;;                :publishing-function (org-html-publish-to-html org-org-publish-to-org)
;;                :style-include-default nil
;;                :html-head "<link rel=\"stylesheet\" href=\"/org.css\" type=\"text/css\" />"
;;                :author-info nil
;;                :creator-info nil)
;;               ("doc-extra"
;;                :base-directory "~/git/doc.norang.ca/"
;;                :publishing-directory "/ssh:www-data@www:~/doc.norang.ca/htdocs"
;;                :base-extension "css\\|pdf\\|png\\|jpg\\|gif"
;;                :publishing-function org-publish-attachment
;;                :recursive nil
;;                :author nil)
;;               ("doc"
;;                :components ("doc-org" "doc-extra"))
;;               ("doc-private-org"
;;                :base-directory "~/git/doc.norang.ca/private"
;;                :publishing-directory "/ssh:www-data@www:~/doc.norang.ca/htdocs/private"
;;                :recursive nil
;;                :section-numbers nil
;;                :table-of-contents nil
;;                :base-extension "org"
;;                :publishing-function (org-html-publish-to-html org-org-publish-to-org)
;;                :style-include-default nil
;;                :html-head "<link rel=\"stylesheet\" href=\"/org.css\" type=\"text/css\" />"
;;                :auto-sitemap t
;;                :sitemap-filename "index.html"
;;                :sitemap-title "Norang Private Documents"
;;                :sitemap-style "tree"
;;                :author-info nil
;;                :creator-info nil)
;;               ("doc-private-extra"
;;                :base-directory "~/git/doc.norang.ca/private"
;;                :publishing-directory "/ssh:www-data@www:~/doc.norang.ca/htdocs/private"
;;                :base-extension "css\\|pdf\\|png\\|jpg\\|gif"
;;                :publishing-function org-publish-attachment
;;                :recursive nil
;;                :author nil)
;;               ("doc-private"
;;                :components ("doc-private-org" "doc-private-extra"))
;;               ;
;;               ; Miscellaneous pages for other websites
;;               ; org are the org-files that generate the content
;;               ("org-org"
;;                :base-directory "~/git/org/"
;;                :publishing-directory "/ssh:www-data@www:~/org"
;;                :recursive t
;;                :section-numbers nil
;;                :table-of-contents nil
;;                :base-extension "org"
;;                :publishing-function org-html-publish-to-html
;;                :style-include-default nil
;;                :html-head "<link rel=\"stylesheet\" href=\"/org.css\" type=\"text/css\" />"
;;                :author-info nil
;;                :creator-info nil)
;;               ;
;;               ; http://doc.norang.ca/  (norang website)
;;               ; org-mode-doc-org this document
;;               ; org-mode-doc-extra are images and css files that need to be included
;;               ; org-mode-doc is the top-level project that gets published
;;               ; This uses the same target directory as the 'doc' project
;;               ("org-mode-doc-org"
;;                :base-directory "~/git/org-mode-doc/"
;;                :publishing-directory "/ssh:www-data@www:~/doc.norang.ca/htdocs"
;;                :recursive t
;;                :section-numbers nil
;;                :table-of-contents nil
;;                :base-extension "org"
;;                :publishing-function (org-html-publish-to-html)
;;                :plain-source t
;;                :htmlized-source t
;;                :style-include-default nil
;;                :html-head "<link rel=\"stylesheet\" href=\"/org.css\" type=\"text/css\" />"
;;                :author-info nil
;;                :creator-info nil)
;;               ("org-mode-doc-extra"
;;                :base-directory "~/git/org-mode-doc/"
;;                :publishing-directory "/ssh:www-data@www:~/doc.norang.ca/htdocs"
;;                :base-extension "css\\|pdf\\|png\\|jpg\\|gif\\|org"
;;                :publishing-function org-publish-attachment
;;                :recursive t
;;                :author nil)
;;               ("org-mode-doc"
;;                :components ("org-mode-doc-org" "org-mode-doc-extra"))
;;               ;
;;               ; http://doc.norang.ca/  (norang website)
;;               ; org-mode-doc-org this document
;;               ; org-mode-doc-extra are images and css files that need to be included
;;               ; org-mode-doc is the top-level project that gets published
;;               ; This uses the same target directory as the 'doc' project
;;               ("tmp-org"
;;                :base-directory "/tmp/publish/"
;;                :publishing-directory "/ssh:www-data@www:~/www.norang.ca/htdocs/tmp"
;;                :recursive t
;;                :section-numbers nil
;;                :table-of-contents nil
;;                :base-extension "org"
;;                :publishing-function (org-html-publish-to-html org-org-publish-to-org)
;;                :html-head "<link rel=\"stylesheet\" href=\"http://doc.norang.ca/org.css\" type=\"text/css\" />"
;;                :plain-source t
;;                :htmlized-source t
;;                :style-include-default nil
;;                :auto-sitemap t
;;                :sitemap-filename "index.html"
;;                :sitemap-title "Test Publishing Area"
;;                :sitemap-style "tree"
;;                :author-info t
;;                :creator-info t)
;;               ("tmp-extra"
;;                :base-directory "/tmp/publish/"
;;                :publishing-directory "/ssh:www-data@www:~/www.norang.ca/htdocs/tmp"
;;                :base-extension "css\\|pdf\\|png\\|jpg\\|gif"
;;                :publishing-function org-publish-attachment
;;                :recursive t
;;                :author nil)
;;               ("tmp"
;;                :components ("tmp-org" "tmp-extra")))))

(setq org-latex-listings t)
(add-to-list 'org-latex-packages-alist '("" "listings"))
(add-to-list 'org-latex-packages-alist '("" "color"))


(setq org-html-xml-declaration
      (quote (("html" . "")
              ("was-html" . "<?xml version=\"1.0\" encoding=\"%s\"?>")
              ("php" . "<?php echo \"<?xml version=\\\"1.0\\\" encoding=\\\"%s\\\" ?>\"; ?>"))))

(setq org-export-allow-BIND t)
(setq org-show-entry-below (quote ((default))))
(setq org-agenda-restriction-lock-highlight-subtree nil)

;; Keep tasks with dates on the global todo lists
(setq org-agenda-todo-ignore-with-date nil)

;; Keep tasks with deadlines on the global todo lists
(setq org-agenda-todo-ignore-deadlines nil)

;; Keep tasks with scheduled dates on the global todo lists
(setq org-agenda-todo-ignore-scheduled nil)

;; Keep tasks with timestamps on the global todo lists
(setq org-agenda-todo-ignore-timestamp nil)

;; Remove completed deadline tasks from the agenda view
(setq org-agenda-skip-deadline-if-done t)

;; Remove completed scheduled tasks from the agenda view
(setq org-agenda-skip-scheduled-if-done t)

;; Remove completed items from search results
(setq org-agenda-skip-timestamp-if-done t)

(setq org-agenda-include-diary nil)
(setq org-agenda-diary-file "~/Dropbox/org/diary.org")

(setq org-agenda-insert-diary-extract-time t)

;; Include agenda archive files when searching for things
(setq org-agenda-text-search-extra-files (quote (agenda-archives)))

;; Show all future entries for repeating tasks
(setq org-agenda-repeating-timestamp-show-all t)

;; Show all agenda dates - even if they are empty
(setq org-agenda-show-all-dates t)

;; Sorting order for tasks on the agenda
(setq org-agenda-sorting-strategy
      (quote ((agenda habit-down time-up user-defined-up effort-up category-keep)
              (todo category-up effort-up)
              (tags category-up effort-up)
              (search category-up))))

;; Start the weekly agenda on Monday
(setq org-agenda-start-on-weekday 1)

;; Enable display of the time grid so we can see the marker for the current time
(setq org-agenda-time-grid
      (quote ((daily today remove-match)
              #("----------------" 0 16 (org-heading t))
              (0900 1100 1300 1500 1700))))

;; Display tags farther right
(setq org-agenda-tags-column -102)

;;
;; Agenda sorting functions
;;
(setq org-agenda-cmp-user-defined 'bh/agenda-sort)


(setq org-enforce-todo-dependencies t)

(setq org-hide-leading-stars nil)

(setq org-startup-indented t)

(setq org-cycle-separator-lines 0)

(setq org-blank-before-new-entry
      (quote ((heading)
              (plain-list-item . auto))))

(setq org-insert-heading-respect-content nil)

(setq org-reverse-note-order nil)

(setq org-show-following-heading t)
(setq org-show-hierarchy-above t)
(setq org-show-siblings (quote ((default))))

(setq org-special-ctrl-a/e t)
(setq org-special-ctrl-k t)
(setq org-yank-adjusted-subtrees t)

(setq org-id-method (quote uuidgen))

(setq org-deadline-warning-days 30)

(setq org-table-export-default-format "orgtbl-to-csv")

(setq org-link-frame-setup
      (quote ((vm . vm-visit-folder)
              (gnus . org-gnus-no-new-news)
              (file . find-file))))

; Use the current window for C-c ' source editing
(setq org-src-window-setup 'current-window)

(setq org-log-done (quote time))
(setq org-log-into-drawer t)
(setq org-log-state-notes-insert-after-drawers nil)

;; (setq org-clock-sound "/usr/local/lib/tngchime.wav")

; Enable habit tracking (and a bunch of other modules)
(setq org-modules (quote (org-bbdb
                          org-bibtex
                          org-crypt
                          org-gnus
                          org-id
                          org-info
                          ;; org-jsinfo
                          org-habit
                          org-inlinetask
                          org-irc
                          org-mew
                          org-mhe
                          org-protocol
                          org-rmail
                          org-vm
                          org-wl
                          org-w3m)))

; position the habit graph on the agenda to the right of the default
(setq org-habit-graph-column 50)
(setq org-use-speed-commands t)
(setq org-speed-commands-user
      (quote (("0" . ignore)
              ("1" . ignore)
              ("2" . ignore)
              ("3" . ignore)
              ("4" . ignore)
              ("5" . ignore)
              ("6" . ignore)
              ("7" . ignore)
              ("8" . ignore)
              ("9" . ignore)

              ("a" . ignore)
              ("d" . ignore)
              ("h" . bh/hide-other)
              ("i" progn
               (forward-char 1)
               (call-interactively 'org-insert-heading-respect-content))
              ("k" . org-kill-note-or-show-branches)
              ("l" . ignore)
              ("m" . ignore)
              ("q" . bh/show-org-agenda)
              ("r" . ignore)
              ("s" . org-save-all-org-buffers)
              ("w" . org-refile)
              ("x" . ignore)
              ("y" . ignore)
              ("z" . org-add-note)

              ("A" . ignore)
              ("B" . ignore)
              ("E" . ignore)
              ("F" . bh/restrict-to-file-or-follow)
              ("G" . ignore)
              ("H" . ignore)
              ("J" . org-clock-goto)
              ("K" . ignore)
              ("L" . ignore)
              ("M" . ignore)
              ("N" . bh/narrow-to-org-subtree)
              ("P" . bh/narrow-to-org-project)
              ("Q" . ignore)
              ("R" . ignore)
              ("S" . ignore)
              ("T" . bh/org-todo)
              ("U" . bh/narrow-up-one-org-level)
              ("V" . ignore)
              ("W" . bh/widen)
              ("X" . ignore)
              ("Y" . ignore)
              ("Z" . ignore))))
(setq org-export-with-timestamps nil)

(setq org-return-follows-link t)

(setq org-remove-highlights-with-change t)

(setq org-read-date-prefer-future 'time)

(setq org-list-demote-modify-bullet (quote (("+" . "-")
                                            ("*" . "-")
                                            ("1." . "-")
                                            ("1)" . "-")
                                            ("A)" . "-")
                                            ("B)" . "-")
                                            ("a)" . "-")
                                            ("b)" . "-")
                                            ("A." . "-")
                                            ("B." . "-")
                                            ("a." . "-")
                                            ("b." . "-"))))

(setq org-tags-match-list-sublevels t)

(setq org-agenda-persistent-filter t)

(setq org-link-mailto-program (quote (compose-mail "%a" "%s")))


(setq org-agenda-skip-additional-timestamps-same-entry t)

(setq org-table-use-standard-references (quote from))

(setq org-file-apps (quote ((auto-mode . emacs)
                            ("\\.mm\\'" . system)
                            ("\\.x?html?\\'" . system)
                            ("\\.pdf\\'" . system))))

; Overwrite the current window with the agenda
(setq org-agenda-window-setup 'current-window)

(setq org-clone-delete-id t)

(setq org-cycle-include-plain-lists t)

(setq org-src-fontify-natively t)

(setq org-structure-template-alist
      (quote (("s" "#+begin_src ?\n\n#+end_src" "<src lang=\"?\">\n\n</src>")
              ("e" "#+begin_example\n?\n#+end_example" "<example>\n?\n</example>")
              ("q" "#+begin_quote\n?\n#+end_quote" "<quote>\n?\n</quote>")
              ("v" "#+begin_verse\n?\n#+end_verse" "<verse>\n?\n</verse>")
              ("c" "#+begin_center\n?\n#+end_center" "<center>\n?\n</center>")
              ("l" "#+begin_latex\n?\n#+end_latex" "<literal style=\"latex\">\n?\n</literal>")
              ("L" "#+latex: " "<literal style=\"latex\">?</literal>")
              ("h" "#+begin_html\n?\n#+end_html" "<literal style=\"html\">\n?\n</literal>")
              ("H" "#+html: " "<literal style=\"html\">?</literal>")
              ("a" "#+begin_ascii\n?\n#+end_ascii")
              ("A" "#+ascii: ")
              ("i" "#+index: ?" "#+index: ?")
              ("I" "#+include %file ?" "<include file=%file markup=\"?\">"))))


(setq org-startup-folded t)




(setq org-src-preserve-indentation nil)
(setq org-edit-src-content-indentation 0)

(setq org-catch-invisible-edits 'error)

(setq org-export-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-charset-priority 'unicode)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)

(setq org-emphasis-alist
      (quote (("*" bold "<b>" "</b>")
              ("/" italic "<i>" "</i>")
              ("_" underline "<span style=\"text-decoration:underline;\">" "</span>")
              ("=" org-code "<code>" "</code>" verbatim)
              ("~" org-verbatim "<code>" "</code>" verbatim))))

(setq org-use-sub-superscripts nil)

(setq org-odd-levels-only nil)

(run-at-time "00:59" 3600 'org-save-all-org-buffers)

;; Hooks
;; (add-hook 'org-insert-heading-hook 'bh/insert-heading-inactive-timestamp 'append)
(add-hook 'org-clock-out-hook 'bh/remove-empty-drawer-on-clock-out 'append)
(add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)
(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)
(add-hook 'org-finalize-agenda-hook 'bh/org-agenda-to-appt 'append)
(run-at-time "24:01" nil 'bh/org-agenda-to-appt)
(run-at-time "06:00" 86400 '(lambda () (setq org-habit-show-habits t)))
(add-hook 'org-mode-hook (lambda () (abbrev-mode 1)))
(add-hook 'org-mode-hook 'auto-fill-mode)
(add-hook 'org-mode-hook
          (lambda ()
            (require 'langtool)
            (setq langtool-language-tool-jar
                  "~/Dropbox/LanguageTool-2.9/languagetool.jar")))
(add-hook 'org-agenda-mode-hook
          '(lambda ()
             (org-defkey
              org-agenda-mode-map "W" (lambda ()
                                        (interactive)
                                        (setq bh/hide-scheduled-and-waiting-next-tasks t)
                                        (bh/widen))))
          'append)
(add-hook 'org-agenda-mode-hook
          '(lambda ()
             (org-defkey
              org-agenda-mode-map "F" 'bh/restrict-to-file-or-follow))
          'append)
(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "N" 'bh/narrow-to-subtree))
          'append)
(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "U" 'bh/narrow-up-one-level))
          'append)
(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "P" 'bh/narrow-to-project))
          'append)
(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "V" 'bh/view-next-project))
          'append)
(add-hook 'org-agenda-mode-hook
          '(lambda () (org-defkey org-agenda-mode-map "\C-c\C-x<" 'bh/set-agenda-restriction-lock))
          'append)
(add-hook 'org-after-todo-state-change-hook 'bh/mark-next-parent-tasks-todo 'append)
(add-hook 'org-clock-in-hook 'bh/mark-next-parent-tasks-todo 'append)

(add-hook 'message-mode-hook 'orgstruct++-mode 'append)
(add-hook 'message-mode-hook 'turn-on-auto-fill 'append)
(add-hook 'message-mode-hook 'bbdb-define-all-aliases 'append)
(add-hook 'message-mode-hook 'orgtbl-mode 'append)
(add-hook 'message-mode-hook
          '(lambda () (setq fill-column 72))
          'append)

;; flyspell mode for spell checking everywhere
(add-hook 'org-mode-hook 'turn-on-flyspell 'append)

;; Disable keys in org-mode
;;    C-c [
;;    C-c ]
;;    C-c ;
;;    C-c C-x C-q  cancelling the clock (we never want this)
(add-hook 'org-mode-hook
          '(lambda ()
             ;; Undefine C-c [ and C-c ] since this breaks my
             ;; org-agenda files when directories are include It
             ;; expands the files in the directories individually
             (org-defkey org-mode-map "\C-c[" 'undefined)
             (org-defkey org-mode-map "\C-c]" 'undefined)
             (org-defkey org-mode-map "\C-c;" 'undefined)
             (org-defkey org-mode-map "\C-c\C-x\C-q" 'undefined))
          'append)

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c M-o") 'bh/mail-subtree))
          'append)


;; Keys
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f5>") 'bh/org-todo)
(global-set-key (kbd "<S-f5>") 'bh/widen)
(global-set-key (kbd "<f7>") 'bh/set-truncate-lines)
(global-set-key (kbd "<f8>") 'org-cycle-agenda-files)
(global-set-key (kbd "<f9> <f9>") 'bh/show-org-agenda)
(global-set-key (kbd "<f9> b") 'bbdb)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> f") 'boxquote-insert-file)
(global-set-key (kbd "<f9> g") 'gnus)
(global-set-key (kbd "<f9> h") 'bh/hide-other)
(global-set-key (kbd "<f9> n") 'bh/toggle-next-task-display)

(global-set-key (kbd "<f9> I") 'bh/punch-in)
(global-set-key (kbd "<f9> O") 'bh/punch-out)

(global-set-key (kbd "<f9> o") 'bh/make-org-scratch)

(global-set-key (kbd "<f9> r") 'boxquote-region)
(global-set-key (kbd "<f9> s") 'bh/switch-to-scratch)

(global-set-key (kbd "<f9> t") 'bh/insert-inactive-timestamp)
(global-set-key (kbd "<f9> T") 'bh/toggle-insert-inactive-timestamp)

(global-set-key (kbd "<f9> v") 'visible-mode)
(global-set-key (kbd "<f9> l") 'org-toggle-link-display)
(global-set-key (kbd "<f9> SPC") 'bh/clock-in-last-task)
(global-set-key (kbd "C-<f9>") 'previous-buffer)
(global-set-key (kbd "M-<f9>") 'org-toggle-inline-images)
(global-set-key (kbd "C-x n r") 'narrow-to-region)
(global-set-key (kbd "C-<f10>") 'next-buffer)
(global-set-key (kbd "<f11>") 'org-clock-goto)
(global-set-key (kbd "C-<f11>") 'org-clock-in)
(global-set-key (kbd "C-s-<f12>") 'bh/save-then-publish)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c c") 'org-capture)

(provide 'init-org)
;;; init-org.el ends here
