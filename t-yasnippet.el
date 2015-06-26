(add-to-list 'load-path (expand-file-name "~/.emacs.d/yasnippet"))
;; config yasnippet
(require 'yasnippet)
(add-to-list 'yas/root-directory "~/.emacs.d/yasnippet-snippets")
(yas/initialize)
(yas/reload-all)
(yas-global-mode 1)
(yas/minor-mode-on)

(provide 't-yasnippet)
