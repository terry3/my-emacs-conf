;; set emacs title
(setq frame-title-format "%f:_terry3")
;; set system clip
(setq x-select-enable-clipboard t)
;; display column number
(setq column-number-mode t)
;; tab = 4 blank
(setq default-tab-width 4)
(setq c-basic-offset 4)
(setq c-default-style "linux")

;; perl 模式下 indent 为 2
(setq perl-indent-level 2)
;; delete tool bar
(menu-bar-showhide-tool-bar-menu-customize-disable)
;; delete scroll bar
(menu-bar-no-scroll-bar)
;; 结束
;(require 'birds-of-paradise-plus-theme)
;; (load-theme birds-of-paradise-plus t)

;; set emacs font, encod
(set-frame-font "Ubuntu mono 14")
(set-fontset-font "fontset-default" 'han '("文泉驿微米黑"))
(color-theme-almost-monokai)

(provide 't-theme)
