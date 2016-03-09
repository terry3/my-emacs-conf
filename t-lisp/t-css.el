(setq css-indent-offset 2)

(add-hook 'css-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((company-yasnippet company-css)))))

(provide 't-css)

