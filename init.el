(add-to-list 'load-path "~/.emacs.d/t-lisp")
(require 't-package)
;; backup files
(require 't-backup)
;; not work?
(require 't-ac)
;; util edit keys
(require 't-edit-keys)
;; include comman keys settings
(require 't-keys)
;; yas
(require 't-yasnippet)
;; lang-c
(require 't-lang-c)
;; not good.
;; (require 't-c-lang)
;; session
(require 't-session)
;; tiny looks
(require 't-looks)
;; org-mode
(require 't-org)
;; misc util
(require 't-util)
;; config emacs look like
(require 't-theme)
;; cedet
;(require 't-cedet)
;; markdown
(require 't-md)
;; perl
(require 't-perl)
;; evil
(require 't-evil)
;; git&git front end config
(require 't-git)
;; highlight mode
(require 't-hl)
;; enable helm
(require 't-helm)
;; javescript config
(require 't-js)
;; css config
(require 't-css)
;; web
(require 't-web)
;; yaml
(require 't-yaml)
;; common lisp
(require 't-cl)
;; sync recipes now
(el-get 'sync)
(provide 't-init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
