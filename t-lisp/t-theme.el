;; With initialization code
;; (el-get-bundle zenburn-theme
;;   :url "https://raw.githubusercontent.com/bbatsov/zenburn-emacs/master/zenburn-theme.el")
;; (require 'zenburn-theme)

;; tangotango
;; (el-get-bundle color-theme-tangotango
;;   (color-theme-tangotango))
;;

;; terry3/oceanic-theme
(el-get-bundle terry3/oceanic-theme
  (progn
    (require 'oceanic-theme)
    (load-theme 'oceanic t)))

(provide 't-theme)
