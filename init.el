
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/t-lisp")

(require 't-package)
(require 't-path)
(require 't-basic)
(require 't-func)
(require 't-helm)
(require 't-complete)
(require 't-projectile)
(require 't-mac)
(require 't-edit)
(require 't-looks)
(require 't-theme)
(require 't-yasnippet)
;; (require 't-flyc)
(require 't-lang-c)
(require 't-md)
(require 't-perl)
(require 't-git)
(require 't-js)
(require 't-web)
(require 't-css)
(require 't-lisp)
(require 't-rkt)
(require 't-clj)
(require 't-org)
(require 't-ts)
(require 't-reasonml)

(el-get 'sync)
(provide 't-init)
