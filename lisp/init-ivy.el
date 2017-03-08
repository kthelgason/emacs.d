(require-package 'ivy)
(after-load 'ivy
  (setq-default ivy-use-virtual-buffers t
                ivy-count-format ""
                projectile-completion-system 'ivy
                ivy-initial-inputs-alist)
  ;; IDO-style directory navigation
  (define-key ivy-minibuffer-map (kbd "C-j") #'ivy-immediate-done)
  (define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
  (diminish 'ivy-mode))

(defun sanityinc/enable-ivy-flx-matching ()
  "Make `ivy' matching work more like IDO."
  (interactive)
  (require-package 'flx)
  (setq-default ivy-re-builders-alist
                '((t . ivy--regex-fuzzy))))

(add-hook 'after-init-hook
          (ivy-mode 1))

(provide 'init-ivy)
