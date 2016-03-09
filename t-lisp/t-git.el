;; git & git front end config
;; bind keys because use so often
(el-get-bundle 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)

(provide 't-git)
