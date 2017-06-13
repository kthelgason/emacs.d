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

(require-package 'key-chord)
(key-chord-mode 1)

;; NerdCommenter
(require-package 'evil-nerd-commenter)

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

  ;; I define keyboard macros twice a year. I don't need a whole key for it.
  (define-key evil-normal-state-map (kbd "q") nil)

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

  (setq-default key-chord-two-keys-delay 0.5)
  (key-chord-define evil-insert-state-map  "jj" 'evil-normal-state)

  (evil-leader/set-key
    "cc" 'evilnc-comment-or-uncomment-lines
    "cr" 'comment-or-uncomment-region
    "cv" 'evilnc-toggle-invert-comment-line-by-line)
  (after-load 'projectile
    (evil-leader/set-key
      "of" 'projectile-find-other-file
      "pf" 'projectile-find-file
      "pp" 'projectile-switch-project))
  (evil-leader/set-key
    "sp" 'ag-project
    "sP" 'ag-project-at-point)
  (after-load 'magit
    (evil-leader/set-key
      "gs" 'magit-status
      "gb" 'magit-blame))
  (after-load 'clang-format
    (evil-leader/set-key
      "fr" 'clang-format-region
      "fb" 'clang-format-buffer))

  ;; Underscore is totes a word character!
  (modify-syntax-entry ?_ "w")
  (defalias 'forward-evil-word 'forward-evil-symbol))


(provide 'init-evil)
