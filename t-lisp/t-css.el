(el-get-bundle 'less-css-mode)
;; set offset in css mode.
(setq css-indent-offset 2)
;; set company complete source
(add-hook 'css-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((company-yasnippet company-css)))))

(provide 't-css)

