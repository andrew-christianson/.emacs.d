(defun htmldash ()
  (interactive)
  (setq-local helm-dash-docsets '("HTML"))
  )
(defun jsdash ()
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript" "D3JS" "jQuery" "NodeJS" "EmberJS"))
  )
(defun cssdash ()
  (interactive)
  (setq-local helm-dash-docsets '("CSS" "Bootstrap" "Bootstrap 3"))
  )

(add-hook 'html-mode-hook 'htmldash)
(add-hook 'html-mode-hook 'skewer-html-mode)

;; web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'\\|\\.jshintrc\\'" . json-mode))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

(defun my-web-mode-hook ()
  (setq web-mode-enable-auto-pairing nil))

(add-hook 'web-mode-hook  'my-web-mode-hook)

(defun sp-web-mode-is-code-context (id action context)
  (when (and (eq action 'insert)
             (not (or (get-text-property (point) 'part-side)
                      (get-text-property (point) 'block-side))))

    t))

(sp-local-pair 'web-mode "<" nil :when '(sp-web-mode-is-code-context))

;;js


;; (add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'jsdash)
(add-hook 'js2-mode-hook (lambda () (flycheck-mode t)))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
;; (add-hook 'js2-mode-hook 'skewer-mode)

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)
      (setq tern-ac-on-dot t)))

;; use web-mode for .jsx files

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))



;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;;css

(add-hook 'css-mode-hook 'cssdash)
(add-hook 'css-mode-hook 'skewer-css-mode)
(provide 'init-web)
