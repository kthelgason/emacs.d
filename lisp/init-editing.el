(require-package 'unfill)

(when (fboundp 'electric-pair-mode)
  (electric-pair-mode))

;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------
(setq-default
 bookmark-default-file (expand-file-name ".bookmarks.el" user-emacs-directory)
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 delete-selection-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 make-backup-files nil
 auto-save-default nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)

(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

(transient-mark-mode t)

(setq-default ring-bell-function nil)

;;; Newline behaviour

(global-set-key (kbd "RET") 'newline-and-indent)

(require-package 'nlinum)

(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(when (fboundp 'global-prettify-symbols-mode)
  (global-prettify-symbols-mode))

(require-package 'undo-tree)
(global-undo-tree-mode)
(diminish 'undo-tree-mode)

(show-paren-mode 1)
(cua-selection-mode t)

(require-package 'highlight-escape-sequences)
(hes-mode)
(diminish 'hes-mode)

(setq-default show-trailing-whitespace t)
;;; Whitespace

(defun sanityinc/no-trailing-whitespace ()
  "Turn off display of trailing whitespace in this buffer."
  (setq show-trailing-whitespace nil))

;; But don't show trailing whitespace in SQLi, inf-ruby etc.
(dolist (hook '(special-mode-hook
                Info-mode-hook
                eww-mode-hook
                term-mode-hook
                comint-mode-hook
                compilation-mode-hook
                twittering-mode-hook
                minibuffer-setup-hook))
  (add-hook hook #'sanityinc/no-trailing-whitespace))


(require-package 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode t)
(diminish 'whitespace-cleanup-mode)

(provide 'init-editing)
