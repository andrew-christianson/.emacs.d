(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)
(package-initialize)

(require 'smartparens-config)
(require 'rainbow-delimiters)
(require 'multiple-cursors)
(require 'ess-site)
(require 'ess-smart-underscore)
(require 'flycheck)

;; Smooth scrolling
;; due to http://stackoverflow.com/a/4160949/881025
;; Works well on OSX 10.10
(require 'smooth-scrolling)
(require 'hlinum)
(require 'helm-config)
(require 'helm-eshell)
(require 'helm-projectile)
(require 'git-gutter-fringe)

(require 'org-agenda)
(require 'paredit)
(require 'wgrep)
(require 'wdired)
(require 'diminish)

(require 'cl)
(require 'pp)
(require 'package-helper)
(provide 'init-packages)
