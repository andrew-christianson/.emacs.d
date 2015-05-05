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

(show-paren-mode 1)

(which-func-mode)

(setq mode-line-format
      (delete (assoc 'which-func-mode mode-line-format) mode-line-format)
      which-func-header-line-format '(which-func-mode ("" which-func-format))
      )
(defadvice which-func-ff-hook (after header-line activate)
  (when which-func-mode
    (setq mode-line-format (delete (assoc 'which-func-mode
                                          mode-line-format) mode-line-format)
          header-line-format which-func-header-line-format)))
(set-face-foreground 'which-func "#A6E22E")

(global-git-gutter-mode 1)
(golden-ratio-mode 1)
(setq golden-ratio-exclude-modes (list "poly-markdown-mode" "poly-noweb+r-mode" "poly-markdown+r-mode"))
(setq-default indicate-buffer-boundaries 'left)
(setq-default indicate-empty-lines 1)
(setq require-final-newline t)
(setq ring-bell-function 'ignore)
(fringe-mode 4)

(if (or (eq system-type 'windows-nt)
        (eq system-type 'darwin))

    (set-face-attribute 'default nil
			:family "Droid Sans Mono for Powerline"
			:height (if (eq system-type 'windows-nt) 90 110)
			:weight 'light
			:width 'normal
			:foundry 'outline
			:slant 'normal))

(if (eq system-type 'gnu/linux)
    (set-face-attribute 'default nil
			:family "Droid Sans Mono for Powerline"
			:slant 'normal
			:weight 'medium
			:height 90
			:width 'normal
			))
(setq calendar-location-name "Los Angeles, CA")
(setq calendar-latitude 34.04)
(setq calendar-longitude -118.25)
;; (change-theme 'my-spolsky 'my-spolsky)
(if window-system (load-theme 'my-spolsky))
;; (set-face-background hl-line-face "darkslategrey")
;; (set-face-background 'fringe "gray15")
(smartparens-global-mode)

;; (setq powerline-default-separator-dir '(right . left))
;; These two lines you really need.
(setq sml/theme 'powerline
      sml/name-width 40
      sml/mode-width 40
      sml/shorten-directory nil
      sml/shorten-modes t
      sml/vc-mode-show-backend t
      )

(setq rm-exclude-modes '("AC" "Helm" "GitGutter" "Projectile" "Smartparens"))
(setq mode-line-in-non-selected-windows nil)
(sml/setup)

;; (rich-minority-mode 'toggle)
(setq rm-blacklist '("Auto-Complete" "helm" "Git-Gutter" "Projectile" "Smartparens"))

;; (flycheck-tip-use-timer 'verbose)
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
;; (pos-tip-w32-max-width-height)
(provide 'init-visual)
