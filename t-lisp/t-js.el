(el-get-bundle 'js2-mode)
;; json-mode
(el-get-bundle 'json-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsm\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers '(javascript-jshint))

;; set js2-mode variables
(setq js2-basic-offset 2        ; set offset in js2-mode
      js2-indent-switch-body t  ; set indent in switch statement
      js-indent-level 2)        ; set json indent width

;; set complete source
(add-hook 'js2-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((company-yasnippet company-dabbrev-code)))))

;; autoload json file
(add-to-list 'auto-mode-alist '("\\.webapp$" . json-mode))
(provide 't-js)
;;; t-js.el ends here
