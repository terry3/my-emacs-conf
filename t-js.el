(require 'js2-mode)
;; (require 'ac-js2)
;; include flymake
(require 'flymake)
(require 'flymake-jshint)
(require 'flymake-cursor)
;; add flymake to js hook
(add-hook 'javascript-mode-hook
          (lambda () (flymake-mode t)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsm\\'" . js2-mode))

(setq js2-basic-offset 2)
;; ac-js2
;; (add-hook 'js2-mode-hook 'ac-js2-mode)

(provide 't-js)
