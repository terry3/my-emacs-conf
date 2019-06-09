(el-get-bundle lsp-mode
  (require 'lsp-mode))

(el-get-bundle company-lsp
  (require 'company-lsp)
  (setq lsp-auto-configure t)
  (push 'company-lsp company-backends))


(global-set-key (kbd "M-9") 'lsp-goto-implementation)
(global-set-key (kbd "M-8") 'lsp-find-references)


(el-get-bundle emacs-lsp/helm-lsp)

(provide 't-lsp)

