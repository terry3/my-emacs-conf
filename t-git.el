;; git & git front end config
;; bind keys because use so often
(setq magit-last-seen-setup-instructions "1.4.0")
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

;; git-gutter
(global-git-gutter-mode +1)

(provide 't-git)
