
(hlinum-activate)
(global-hl-line-mode 1)
; don't blink the cursor
(blink-cursor-mode nil)

;; (define-global-minor-mode my-global-linum-mode linum-mode
;;   (lambda ()
;;     (when (not (memq major-mode
;;                      (list 'doc-view-mode 'doc-view-minor-mode)))
;;       (linum-mode))))
;; (my-global-linum-mode t)

(setq inhibit-startup-screen t)
(display-time-mode t)
(show-paren-mode t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; (show-paren-mode 1)

(which-function-mode)

(setq mode-line-format
      (delete (assoc 'which-func-mode mode-line-format) mode-line-format)
      which-func-header-line-format '(which-func-mode ("" which-func-format)))

(defadvice which-func-ff-hook (after header-line activate)
  (when which-func-mode
    (setq mode-line-format (delete (assoc 'which-func-mode
                                          mode-line-format) mode-line-format)
          header-line-format which-func-header-line-format)))

(set-face-foreground 'which-func "#A6E22E")

(global-git-gutter-mode 1)

;; (golden-ratio-mode 1)
;; (setq golden-ratio-exclude-modes (list "poly-markdown-mode" "poly-noweb+r-mode" "poly-markdown+r-mode" "Guide")
;;       golden-ratio-adjust-factor .8
;;       golden-ratio-wide-adjust-factor .8
;;       golden-ratio-exclude-buffer-names (list "guide-keys"))

(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines 1)
(setq require-final-newline t)
(setq ring-bell-function 'ignore)
(fringe-mode 4)

(set-face-attribute 'default nil
                    :family (if (eq system-type 'windows-nt)
                                "Droid Sans Mono"
                             "Liberation Mono")
                    :height 90
                    :weight 'regular
                    :width 'normal
                    :foundry 'outline
                    :slant 'normal
                    )

(setq calendar-location-name "Los Angeles, CA")
(setq calendar-latitude 34.04)
(setq calendar-longitude -118.25)
;; (change-theme 'my-spolsky 'my-spolsky)
(if window-system (load-theme 'solarized-light))
;; (set-face-background hl-line-face "darkslategrey")
;; (set-face-background 'fringe "gray15")


;; (add-hook 'prog-mode-hook 'paredit-everywhere-mode)
;; (setq powerline-default-separator-dir '(right . left))
;; These two lines you really need.
;; (setq sml/theme 'powerline
;;       sml/name-width 40
;;       sml/mode-width 40
;;       sml/shorten-directory nil
;;       sml/shorten-modes t
;;       sml/vc-mode-show-backend t

;;       )
;; (sml/setup)
(setq rm-exclude-modes '("AC" "Helm" "GitGutter" "Projectile" "Smartparens"))
(setq mode-line-in-non-selected-windows nil)


;; (rich-minority-mode 'toggle)
(setq rm-blacklist '("Auto-Complete" "helm" "Git-Gutter" "Projectile" "Smartparens"))
;; (symon-mode nil)
;; (flycheck-tip-use-timer 'verbose)
;; (eval-after-load 'flycheck
;;   '(custom-set-variables
;;    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;; (pos-tip-w32-max-width-height)
(provide 'init-visual)
