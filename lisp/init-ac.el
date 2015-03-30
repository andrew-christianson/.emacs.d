(require 'auto-complete-config)
;; (require 'ac-helm) ;; Not necessary if using ELPA package

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq-default ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed

(set-default 'ac-sources
             '(ac-source-imenu
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))
(setq ac-delay 0.1
      ac-use-comphist t
      ac-comphist-file "~/.emacs.d/ac-comphist.dat"
      ac-fuzzy-cursor-color 'green
      ac-quick-help-delay 0.125
      ac-auto-show-menu t
      ac-use-fuzzy t
      ac-show-menu-immediately-on-auto-complete t
      ac-candidate-limit nil
      ac-menu-height 10
      ac-max-width 0.8
      )
;; (setq-default ac-sources (append ac-sources '(ac-source-filename ac-source-yasnippet)))
;; don't wamt this.
;; Default is:
;; TAB, C-i 	ac-expand 	Completion by TAB
;; RET, C-m 	ac-complete 	Completion by RET
;; down, M-n 	ac-next 	Select next candidate
;; up, M-p 	ac-previous 	Select previous candidate
;; C-?, f1 	ac-help 	Show buffer help

;; (define-key ac-completing-map (kbd "TAB") 'ac-complete)
(define-key ac-completing-map (kbd "C-h") 'ac-quick-help)
(define-key ac-completing-map (kbd "C-S-c h") 'ac-complete-with-helm)
(define-key ac-mode-map (kbd "C-S-c c") 'auto-complete)

(global-auto-complete-mode)
(ac-linum-workaround)

(provide 'init-ac)
