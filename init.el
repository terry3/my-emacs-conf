
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'dired-x)
    (setq-default dired-omit-files-p t) ; Buffer-local variable
    (setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

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
(require 't-flyc)
(require 't-lang-c)
(require 't-md)
(require 't-perl)
(require 't-git)
(require 't-js)
(require 't-web)
(require 't-css)
(require 't-lisp)
(require 't-clj)
(require 't-org)

(el-get 'sync)
(provide 't-init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(slime queue))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
