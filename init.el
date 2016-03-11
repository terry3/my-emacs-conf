(add-to-list 'load-path "~/.emacs.d/t-lisp")
(require 't-package)
;; backup files
(require 't-backup)
;; tiny looks
(require 't-looks)
;; config emacs look like
(require 't-theme)
;; yas
(require 't-yasnippet)
;; util edit keys
(require 't-edit-keys)
;; include comman keys settings
(require 't-keys)
;; lang-c
(require 't-lang-c)
;; session
(require 't-session)
;; org-mode
(require 't-org)
;; misc util
(require 't-util)
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
;; javescript config
(require 't-js)
;; enable helm
(require 't-helm)
;; css config
(require 't-css)
;; web
(require 't-web)
;; yaml
(require 't-yaml)
;; common lisp
(require 't-cl)
;; complete sth
(require 't-complete)
;; project
(require 't-projectile)
;; sync recipes now
(el-get 'sync)
(provide 't-init)
