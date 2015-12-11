(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(require 't-package)
;; backup files
(require 't-backup)
;; not work?
(require 't-ac)
;; util edit keys
(require 't-edit-keys)
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
(provide 't-init)
