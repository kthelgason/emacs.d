;;; init.el -*- lexical-binding: t; -*-

;; Copyright (c) 2017 Kári Tristan Helgason <kthelgason@gmail.com>

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free Software
;; Foundation; either version 3 of the License, or (at your option) any later
;; version.

;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
;; details.

;; You should have received a copy of the GNU General Public License along with
;; GNU Emacs; see the file COPYING.  If not, write to the Free Software
;; Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301,
;; USA.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (version< emacs-version "25")
  (warn "Emacs version too old! This is version %s!" emacs-version))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *is-a-mac* (eq system-type 'darwin))

(defconst *brew-prefix*
  (if *is-a-mac*
      (shell-command-to-string "brew --prefix | tr -d '\n'")
      nil))


(setq gc-cons-threshold (* 128 1024 1024))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Backups
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(eval-when-compile (require 'cl))
(require 'init-utils)
(require 'init-elpa)

(require-package 'diminish)

(require 'init-path)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-isearch)
(require 'init-grep)
(require 'init-flycheck)
(require 'init-smex)
(require 'init-helm)
;; (require 'init-ivy)
(require 'init-fonts)
(require 'init-editing)
(require 'init-git)
(require 'init-evil)
(require 'init-projectile)
(require 'init-paredit)
(require 'init-modeline)
(require 'init-rtags)

;; Language-specific
(require 'init-c)
(require 'init-clojure)
(require 'init-elixir)
(require 'init-lisp)
(require 'init-web)

(require-package 'markdown-mode)

(require 'init-site-lisp)

(require 'server)
(unless (server-running-p)
  (server-start))

(when (maybe-require-package 'base16-theme)
  (load-theme 'base16-eighties))

(add-hook 'after-init-hook
  (lambda ()
    (message "init completed in %.2fms"
             (sanityinc/time-subtract-millis after-init-time before-init-time))))

(provide 'init)
;;; init.el ends here

