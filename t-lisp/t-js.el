;; web-mode
(el-get-bundle 'web-mode)
;; json-mode
(el-get-bundle 'json-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers '(javascript-jshint))

;; set web-mode indent
(setq web-mode-markup-indent-offset 2  ; html
      web-mode-css-indent-offset    2  ; css
      web-mode-code-indent-offset   2) ; js

(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))

;; set complete source
(add-hook 'web-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((company-yasnippet company-dabbrev-code)))))

;; autoload json file
(add-to-list 'auto-mode-alist '("\\.webapp$" . json-mode))
(provide 't-js)
;;; t-js.el ends here
