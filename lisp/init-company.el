(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-show-numbers t
      company-tooltip-limit 20
      company-tooltip-align-annotations t
      company-tooltip-minimum-width 40
      company-minimum-prefix-length 1
      company-idle-delay 0.15
      )
(add-hook 'company-mode-hook
	  (lambda ()
	    (define-key company-mode-map (kbd "C-M-/") 'company-complete)))

(provide 'init-company)
