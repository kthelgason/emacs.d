;; Use smex to handle M-x
(require-package 'smex)
(require-package 'helm-smex)
;; Change path for ~/.smex-items
(setq-default smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(global-set-key [remap execute-extended-command] #'helm-smex)

(provide 'init-smex)
