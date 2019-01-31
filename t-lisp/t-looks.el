(el-get-bundle 'dired+)
;; display dired details always
(setq diredp-hide-details-initially-flag nil)

;; delete tool bar
(menu-bar-showhide-tool-bar-menu-customize-disable)
;; delete scroll bar
(menu-bar-no-scroll-bar)

;; set cursor type to bar
(setq-default cursor-type 'bar)
;; set cursor type to box
;;(setq-default cursor-type 'box)

(el-get-bundle 'highlight)

;; turn on highlighting current line
(global-hl-line-mode 1)
(set-face-background hl-line-face "gray13")

;; hightlight symbol
(el-get-bundle 'highlight-symbol)
(setq highlight-symbol-idle-delay 0.5)
(highlight-symbol-mode t)

;; hightlight symbol key bindings
(global-set-key (kbd "M-0") 'highlight-symbol)
(global-set-key (kbd "M-8") 'highlight-symbol-prev)
(global-set-key (kbd "M-9") 'highlight-symbol-next)

;; modeline
(el-get-bundle 'doom-modeline
  (progn
    (require 'doom-modeline)
    (doom-modeline-mode 1)))

(provide 't-looks)
