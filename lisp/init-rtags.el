(when *brew-prefix*
  (add-to-list 'load-path (expand-file-name "share/emacs/site-lisp/rtags" *brew-prefix*)))

(if (locate-library (symbol-name 'rtags))
  (require 'rtags)

  (after-load 'evil
    (evil-leader/set-key
      "tr" 'rtags-find-references-at-point
      "tR" 'rtags-find-references
      "ts" 'rtags-find-symbol-at-point
      "tS" 'rtags-find-symbol))

  (dolist (mode '(c-mode-hook c++-mode-hook objc-mode-hook))
    (add-hook mode 'rtags-start-process-unless-running)))

(provide 'init-rtags)
