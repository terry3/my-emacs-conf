;; I have OneNote now.
;;
;;
;;
;;
;;
;;
;; 设置 org-mode 中 org-agenda 快捷键
;; (add-hook 'org-mode-hook
;;           (lambda () (local-set-key (kbd "C-c a") #'org-agenda)))

;; ;; 设置 org-mode 中 写日记模板与快捷键
;; (global-set-key (kbd "<f7>") 'org-capture)
;; (setq org-capture-templates
;;       '(("t" "HOME-TODO" entry (file+headline "~/terry3/gtd/todo-general.org" "HAPPY") ;; 必须指定 org-mode 上级目录名称
;;          "* TODO %?\n  %i\n %T\n %a")
;;         ("o" "OFFICE-TODO" entry (file+headline "~/terry3/office/OFFICET-ODO.org" "OFFICE") ;; OFFICE
;;          "* TODO %?\n  %i\n %T\n %a")
;;          ("n" "TIMES-FLY" entry (file+headline "~/terry3/office/TIMES.org" "TIMES") ;; TIMES FLY
;;          "* %?\nEntered on %U\n  %i\n  %a")
;;         ("j" "JOURNAL" entry (file+datetree "~/terry3/gtd/diary.org")
;;          "* %?\nEntered on %U\n  %i\n  %a")))

(provide 't-org)
