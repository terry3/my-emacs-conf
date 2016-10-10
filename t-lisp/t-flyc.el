(el-get-bundle 'json-snatcher)
(el-get-bundle 'json-reformat)
(el-get-bundle 'haml-mode)

(el-get-bundle 'flycheck
  (progn
    (require 'flycheck)
    ;; enable flycheck all the time
    (add-hook 'after-init-hook #'global-flycheck-mode)
    ;; disable json-jsonlist checking for json files
    (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(json-jsonlist)))
    ;; disable jshint since we prefer eslint checking
    (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))
    ;; use eslint with web-mode for jsx files
    ;; (flycheck-add-mode 'html-tidy 'web-mode)
    ;; (flycheck-add-mode 'javascript-eslint 'web-mode)
    ))

(provide 't-flyc)
;;; t-flyc.el ends here
