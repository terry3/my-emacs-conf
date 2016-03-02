(el-get-bundle 'js2-mode)
;; (require 'ac-js2)
;; include flymake
(el-get-bundle 'flymake)
(el-get-bundle 'flymake-jshint
  :url "https://github.com/Wilfred/flymake-jshint.el/blob/master/flymake-jshint.el")
(el-get-bundle 'flymake-cursor)
;; add flymake to js hook
(add-hook 'javascript-mode-hook
          (lambda () (flymake-mode t)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsm\\'" . js2-mode))

(setq js2-basic-offset 2)
(setq js2-indent-switch-body t)
;; ac-js2
;; (add-hook 'js2-mode-hook 'ac-js2-mode)

(provide 't-js)
