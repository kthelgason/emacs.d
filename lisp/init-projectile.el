(require-package 'projectile)
(add-hook 'after-init-hook 'projectile-global-mode)

(setq projectile-completion-system 'ivy)

(after-load 'projectile (diminish 'projectile-mode))

(provide 'init-projectile)
