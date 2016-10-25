(el-get-bundle 'less-css-mode)
(el-get-bundle 'sass-mode)

;; set offset in css mode.
(setq css-indent-offset 2)
;; set company complete source
(add-hook 'css-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((company-yasnippet company-css)))))

;; add wx css file to css-mode
(add-to-list 'auto-mode-alist '("\\.wxss\\'" . css-mode))

(provide 't-css)
