;; git & git front end config
;; bind keys because use so often
(setq magit-last-seen-setup-instructions "1.4.0")
(el-get-bundle 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(provide 't-git)
