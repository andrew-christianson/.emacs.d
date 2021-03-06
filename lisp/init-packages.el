(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/"))
      )
(require 'cask "~/.cask/cask.el")

(cask-initialize)

(require 'pallet)

(pallet-mode t)
(package-initialize)

(require 'rainbow-delimiters)
(require 'multiple-cursors)
(require 'ess-site)
(require 'ess-smart-underscore)
(require 'flycheck)

(if (not (eq system-type 'windows-nt))
    (require 'pos-tip))

(require 'flycheck-pos-tip)
(require 'vlf-setup)
(require 'guide-key)

;; Smooth scrolling
;; due to http://stackoverflow.com/a/4160949/881025
;; Works well on OSX 10.10
(require 'smooth-scrolling)
(require 'hlinum)
(require 'helm-config)
(require 'helm-eshell)
(require 'helm-projectile)
(require 'project-explorer)
(require 'git-gutter-fringe)

;; org/organize your life in plain text requires
(require 'org)
(require 'org-agenda)
(require 'org-id)
(require 'org-checklist)
(require 'org-protocol)
(require 'org-mime)
(require 'ox-html)
(require 'ox-latex)
(require 'ox-ascii)

(require 'golden-ratio)
(require 'paredit)
(require 'wgrep)
(require 'wdired)
(require 'diminish)
(require 'expand-region)

(require 'cl)
(require 'pp)
(require 'package-helper)
(require 'cal-dst)

(require 'poly-markdown)
(require 'poly-R)
(require 'hyde)
(require 'hydra)
(require 'bind-key)
(require 'symon)
(provide 'init-packages)
