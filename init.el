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

(require 't-c-lang)


(provide 't-init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/schedule/test.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
