(require-package 'paredit)

(after-load 'paredit
  (diminish 'paredit-mode "()")
  ;; Suppress certain paredit keybindings to avoid clashes, including
  ;; my global binding of M-?
  (dolist (binding '("C-<left>" "C-<right>" "C-M-<left>" "C-M-<right>" "M-?"))
    (define-key paredit-mode-map (read-kbd-macro binding) nil)))

(require-package 'paredit-everywhere)

(add-hook 'prog-mode-hook 'paredit-everywhere-mode)
(after-load 'paredit-everywhere
  (diminish 'paredit-everywhere-mode "()"))

(provide 'init-paredit)
