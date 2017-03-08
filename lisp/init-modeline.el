(require-package 'spaceline)
(require 'spaceline-config)

(spaceline-spacemacs-theme)

(setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state
      spaceline-buffer-size-p nil
      powerline-default-separator 'utf-8)


(spaceline-compile 'kthelgason
 ;;; Left side
 '(((evil-state) :face highlight-face)
   anzu
   (buffer-modified buffer-id)
   major-mode
   process
   (flycheck-error flycheck-warning flycheck-info)
   ((minor-modes) :when active))
 ;;; Right side
 '((version-control :when active)
   (line-column hud)))

(setq-default mode-line-format '("%e" (:eval (spaceline-ml-kthelgason))))

(provide 'init-modeline)
