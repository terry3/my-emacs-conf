;; (color-theme-molokai)
;; (color-theme-deep-blue)
;; (color-theme-solarized-light)
;; tmp color theme, my eyes were weeping.
;; (color-theme-gnome2)
;; (color-theme-almost-monokai)
;; (color-theme-tango-2)
;; (color-theme-tango)
;; (color-theme-tangotango)
;; (color-theme-zenburn)

;; (load-theme 'ample t t)
;; (load-theme 'ample-flat t t)
;; (load-theme 'ample-light t t)
;; choose one to enable
;; (enable-theme 'ample)
;; (enable-theme 'ample-flat)
;; (enable-theme 'ample-light)
;; (require 'color-theme-sanityinc-tomorrow)

;; With initialization code
;; (el-get-bundle zenburn-theme
;;   :url "https://raw.githubusercontent.com/bbatsov/zenburn-emacs/master/zenburn-theme.el")

;; set color theme to solarized
(el-get-bundle color-theme-solarized)
(setq frame-background-mode 'dark)
(load-theme 'solarized t)
(provide 't-theme)
