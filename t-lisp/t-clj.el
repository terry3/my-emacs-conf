(el-get-bundle clojure-mode)
(el-get-bundle cider)

;; boot file recognise
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))

(provide 't-clj)
