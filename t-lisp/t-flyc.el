(el-get-bundle 'flycheck)

;; enable flycheck all the time
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 't-flyc)
;;; t-flyc.el ends here
