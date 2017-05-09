;; clang-format
(require-package 'clang-format)

;; ObjC-mode configuration
(add-to-list 'auto-mode-alist '("\\.mm?\\'" . objc-mode))
(add-to-list 'magic-mode-alist
                `(,(lambda ()
                     (and (string= (file-name-extension buffer-file-name) "h")
                          (re-search-forward "@\\<interface\\>"
                                             magic-mode-regexp-match-limit t)))
                  . objc-mode))

(provide 'init-c)
