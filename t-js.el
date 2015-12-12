(setq js-indent-level 2)
;; include flymake
(require 'flymake)
(require 'flymake-jshint)
(require 'flymake-cursor)
;; add flymake to js hook
(add-hook 'javascript-mode-hook
     (lambda () (flymake-mode t)))

(provide 't-js)
