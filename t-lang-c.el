(el-get-bundle 'xcscope)
(add-hook 'c-mode-common-hook
          '(lambda ()
             (el-get-bundle 'xcscope)))

;; 不自动更新cscope数据库
(setq cscope-do-not-update-database t)
;; 自动使用-q选项
(setq cscope-option-use-inverted-index t)


(defun terry-update-cscope-database ()
  "execute cscope -bRq command to update cscope database."
  (interactive)
  (message (shell-command-to-string "cscope -bRq"))
  )


;; require clang
;; (require 'auto-complete-clang)
;; find out the include file search pathes of your g++:
;; echo "" | g++ -v -x c++ -E -

(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)

;; gtags config
;; (add-to-list 'load-path (expand-file-name "C:/terry3/soft/gnu-glob/share/gtags/"))

;;(require 'gtags)
;;(require 'xgtags)
;;(add-hook 'c-mode-common-hook
;;          (lambda ()
;;            (xgtags-mode 1)))
;; \e means ESC
;;

;; set <F5> to the leader of C-c w
;;(require 'xgtags-extension)

;; find global file
(global-set-key (kbd "M-4") 'cscope-find-this-file)
;; find global reference
(global-set-key (kbd "M-3") 'cscope-find-this-symbol)
;; find global definition
(global-set-key (kbd "M-2") 'cscope-find-global-definition)
;; return to prev position
(global-set-key (kbd "M-1") 'cscope-pop-mark)

(provide 't-lang-c)
