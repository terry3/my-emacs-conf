(el-get-bundle 'js2-mode)
;; include flymake
(el-get-bundle 'flymake)
(el-get-bundle 'flymake-jshint
  :url "https://github.com/Wilfred/flymake-jshint.el/blob/master/flymake-jshint.el")
(el-get-bundle 'flymake-cursor)
;; json-mode
(el-get-bundle 'json-mode)
;; add flymake to js hook
(add-hook 'javascript-mode-hook
          (lambda () (flymake-mode t)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsm\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))

;; set js2-mode variables
(setq js2-basic-offset 4        ; set offset in js2-mode
      js2-indent-switch-body t  ; set indent in switch statement
      js-indent-level 4)        ; set json indent width

;; set complete source
(add-hook 'js2-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((company-yasnippet company-dabbrev-code)))))

;; autoload json file
(add-to-list 'auto-mode-alist '("\\.webapp$" . json-mode))
(provide 't-js)
