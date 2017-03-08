(require-package 'git-blamed)
(require-package 'gitignore-mode)
(require-package 'gitconfig-mode)

(require-package 'magit)
(require-package 'evil-magit)
(setq-default magit-diff-refine-hunk t)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(after-load 'magit
  (add-hook 'magit-popup-mode-hook 'sanityinc/no-trailing-whitespace)
  (setq magit-save-repository-buffers 'dontask))

;; Convenient binding for vc-git-grep
(global-set-key (kbd "C-x v f") 'vc-git-grep)

(require-package 'diff-hl)
(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(provide 'init-git)
