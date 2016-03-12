;; basic configuration

;; set backup directory
(setq backup-by-copying t
      backup-directory-alist
      '(("." . "~/.emacs_backup"))
      delete-old-versions t ; delete old version auto
      kept-new-versions 6 ; keep 6 backup
      kept-old-versions 2
      version-control t)

;; basic
;;
;;
(setq-default
 blink-cursor-delay 0
 blink-cursor-interval 0.4
 bookmark-default-file "~/.emacs.d/.bookmarks.el"
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 line-spacing 0.2
 show-trailing-whitespace t
 truncate-lines nil
 truncate-partial-width-windows nil
 )

;; set visual active
(transient-mark-mode t)
;; set system clip
(setq x-select-enable-clipboard t)
;; display column number
(setq column-number-mode t)
;; tab = 4 blank
(setq default-tab-width 4)
;; kill the whole line
(setq kill-whole-line t)

;; encoding
;;
;;
;; set default buffer file system coding
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

;; save desktop
(desktop-save-mode 1)

(provide 't-basic)
