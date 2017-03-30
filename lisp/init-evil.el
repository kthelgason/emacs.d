(require-package 'evil-leader)
(require 'evil-leader)
(evil-leader/set-leader ",")
(global-evil-leader-mode t)

;; Here's what we've all been waiting for.
;; Recreate Vim inside Emacs.
(require-package 'evil)
(require 'evil)
(evil-mode 1)
(setq evil-want-change-word-to-end t)

(setq-default evil-shift-width 2)

(after-load 'evil
  (defmacro evil-map (state key seq)
    "Map for a given STATE a KEY to a sequence SEQ of keys.
Can handle recursive definition only if KEY is the first key of SEQ.
Example: (evil-map visual \"<\" \"<gv\")"
    (let ((map (intern (format "evil-%S-state-map" state))))
      `(define-key ,map ,key
         (lambda ()
           (interactive)
           ,(if (string-equal key (substring seq 0 1))
                `(progn
                   (call-interactively ',(lookup-key evil-normal-state-map key))
                   (execute-kbd-macro ,(substring seq 1)))
              (execute-kbd-macro ,seq))))))

  ;; Keep the region active when shifting
  (evil-map visual "<" "<gv")
  (evil-map visual ">" ">gv")

  ;; Easy split navigation
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

  (define-key evil-visual-state-map "J" (concat ":m '>+1" (kbd "RET") "gv=gv"))
  (define-key evil-visual-state-map "K" (concat ":m '<-2" (kbd "RET") "gv=gv"))

  ;; ESC quits everything!
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

  (evil-leader/set-key
    "of" 'ff-get-other-file)
  (after-load 'projectile
    (evil-leader/set-key
      "pf" 'projectile-find-file
      "pp" 'projectile-switch-project))
    (evil-leader/set-key
      "sp" 'ag-project
      "sP" 'ag-project-at-point)

  (defalias 'forward-evil-word 'forward-evil-symbol))

(provide 'init-evil)
