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

