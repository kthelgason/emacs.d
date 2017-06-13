(require-package 'helm)
(require 'helm-config)

(setq-default helm-split-window-in-side-p t
              helm-autoresize-mode-min-height 5
              helm-autoresize-mode-max-height 20)

(add-hook 'after-init-hook
	  (lambda ()
	    (helm-autoresize-mode t)
	    (helm-mode 1)
            (diminish 'helm-mode)))

(global-set-key (kbd "C-x C-f") 'helm-find-files)

(provide 'init-helm)
