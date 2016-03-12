(el-get-bundle 'xcscope)

;; set c variables
(setq c-basic-offset 4
      c-default-style "K&R"
      cscope-do-not-update-database t     ; do not update database auto
      cscope-option-use-inverted-index t) ;add -q param cuz it's quick

(add-hook 'c-mode-common-hook
          '(lambda ()
             (el-get-bundle 'xcscope)))

(provide 't-lang-c)
