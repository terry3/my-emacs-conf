(el-get-bundle rainbow-delimiters)
(el-get-bundle pos-tip)
(el-get-bundle 'racket-mode
  (require 'racket-mode)
  ;; remove <f5> key binding, set it to C-c r
  (add-hook 'racket-mode-hook
            (lambda ()
              (local-unset-key (kbd "<f5>"))
              (local-set-key (kbd "C-c r") 'racket-run-and-switch-to-repl)))
  ;; (add-hook 'racket-mode-hook
  ;;           #'(lambda () (yas-activate-extra-mode 'emacs-lisp-mode)))
  )
(provide 't-rkt)
