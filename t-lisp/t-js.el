;; web-mode
(el-get-bundle 'web-mode)
;; json-mode
(el-get-bundle 'json-mode)
;; mocha snippets
(el-get-bundle 'cowboyd/mocha-snippets.el)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers '(javascript-jshint))

;; set web-mode indent
(setq web-mode-markup-indent-offset 2  ; html
      web-mode-css-indent-offset    2  ; css
      web-mode-code-indent-offset   2  ; js
      js-indent-level 2)               ; for json

(add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.webapp$" . json-mode))

;; set complete source
(add-hook 'web-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((company-yasnippet company-dabbrev-code company-css)))))


(defun terry3/beautify-hook ()
  "automatically format before saving a file(js/jsx/css/html)"
  (setq file-suffix (file-name-extension buffer-file-name))
  (cond ((string= file-suffix "js") (web-beautify-js-buffer))
        ((string= file-suffix "jsx") (web-beautify-js-buffer))
        ((string= file-suffix "css") (web-beautify-css-buffer))
        ((string= file-suffix "html") (web-beautify-html-buffer))))

(add-hook 'web-mode-hook
          #'(lambda () (yas-activate-extra-mode 'js-mode)))


;; set jsx in js file
(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))

(provide 't-js)
;;; t-js.el ends here
