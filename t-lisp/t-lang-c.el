(el-get-bundle 'xcscope)
(add-hook 'c-mode-common-hook
          '(lambda ()
             (el-get-bundle 'xcscope)))

;; do not update database auto
(setq cscope-do-not-update-database t)
;; add -q param cuz it's quick
(setq cscope-option-use-inverted-index t)

(setq c-basic-offset 4)
(setq c-default-style "K&R")


(provide 't-lang-c)
