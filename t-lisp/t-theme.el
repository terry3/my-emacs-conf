;; With initialization code
;; (el-get-bundle zenburn-theme
;;   :url "https://raw.githubusercontent.com/bbatsov/zenburn-emacs/master/zenburn-theme.el")
;; (require 'zenburn-theme)

;; tangotango
;; (el-get-bundle color-theme-tangotango
;;   (color-theme-tangotango))
;;

;; darkokai-theme
(el-get-bundle sjrmanning/darkokai
  (progn
    (require 'darkokai-theme)
    (load-theme 'darkokai t)))

(provide 't-theme)
