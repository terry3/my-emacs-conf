;; basic configuration

;; set backup directory
(setq backup-by-copying t
      backup-directory-alist
      '(("." . "~/.emacs_backup"))
      delete-old-versions t ; delete old version auto
      kept-new-versions 6   ; keep 6 backup
      kept-old-versions 2
      version-control t)

;; basic
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
 buffer-file-coding-system 'utf-8-unix
 default-buffer-file-coding-system 'utf-8-unix)

(setq x-select-enable-clipboard t ; set system clip
      column-number-mode t        ; display column number
      default-tab-width 4         ;tab = 4 blank
      kill-whole-line t)          ;kill the whole line

;; encoding
;; set default buffer file system coding
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; set visual active
(transient-mark-mode t)

;; save desktop
(desktop-save-mode 1)

(provide 't-basic)
