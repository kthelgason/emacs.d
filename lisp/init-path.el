(when *is-a-mac*
  (require-package 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

(provide 'init-path)
