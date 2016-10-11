;; git & git front end config
;; bind keys because use so often
(el-get-bundle 'magit
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
  ;; workaround
  (setq with-editor-file-name-history-exclude 1))

(provide 't-git)
