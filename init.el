(add-to-list 'load-path (expand-file-name "~/.emacs.d"))



(require 't-package)

;; backup files
(require 't-backup)
;; config emacs look like
(require 't-theme)
;; util edit keys
(require 't-edit-keys)

(require 't-yasnippet)
(require 't-ac)
(require 't-util)

(require 't-session)
(require 't-looks)


(provide 't-init)

