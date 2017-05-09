(require-package 'projectile)
(require-package 'helm-projectile)

(add-hook 'after-init-hook 'projectile-global-mode)
(helm-projectile-on)

(after-load 'projectile (diminish 'projectile-mode))

(provide 'init-projectile)
