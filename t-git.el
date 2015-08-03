;; git & git front end config
;; bind keys because use so often
(setq magit-last-seen-setup-instructions "1.4.0")
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(provide 't-git)
