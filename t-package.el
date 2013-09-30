(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; It's very important to add this 2013-09-30
(package-initialize)
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(el-get 'sync)
(provide 't-package)
