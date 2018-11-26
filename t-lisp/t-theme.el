;; With initialization code
;; (el-get-bundle zenburn-theme
;;   :url "https://raw.githubusercontent.com/bbatsov/zenburn-emacs/master/zenburn-theme.el")
;; (require 'zenburn-theme)

;; tangotango
;; (el-get-bundle juba/color-theme-tangotango
;;  (load-theme 'tangotango t))

(add-to-list 'custom-theme-load-path "~/.emacs.d/misc/")
(add-to-list 'load-path "~/.emacs.d/misc/emacs-doom-themes/")

(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
;; (load-theme 'doom-one t)
;; (load-theme 'doom-vibrant t)
;; (load-theme 'doom-molokai t)
;; (load-theme 'doom-nova t)
;; (load-theme 'doom-one-light t)
;; (load-theme 'doom-peacock t)
(load-theme 'doom-tomorrow-night t)
;; (load-theme 'doom-spacegrey t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)
;; (load-theme 'dracula t)
;; (el-get-bundle leuven-theme
;;   (load-theme 'leuven t))

;; terry3/oceanic-theme
;; (el-get-bundle terry3/oceanic-theme
;;   (progn
;;     (require 'oceanic-theme)
;;     (load-theme 'oceanic t)))

(provide 't-theme)
