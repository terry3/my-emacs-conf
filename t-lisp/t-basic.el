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

;; auto kill buffers
(require 'midnight)
;;kill buffers if they were last disabled more than this seconds ago
(setq clean-buffer-list-delay-special 7200)

(defvar clean-buffer-list-timer nil
  "Stores clean-buffer-list timer if there is one. You can disable clean-buffer-list by (cancel-timer clean-buffer-list-timer).")

;; run clean-buffer-list every 2 hours
(setq clean-buffer-list-timer (run-at-time t 14400 'clean-buffer-list))

;; kill everything, clean-buffer-list is very intelligent at not killing
;; unsaved buffer.
(setq clean-buffer-list-kill-regexps '("^.*$"))

;; keep these buffer untouched
;; prevent append multiple times
(defvar clean-buffer-list-kill-never-buffer-names-init
  clean-buffer-list-kill-never-buffer-names
  "Init value for clean-buffer-list-kill-never-buffer-names")
(setq clean-buffer-list-kill-never-buffer-names
      (append
       '("*Messages*"
         "*cmd*"
         "*scratch*"
         "*helm projectile*"
         "*helm M-x*"
         "*Helm Find Files*")
       clean-buffer-list-kill-never-buffer-names-init))

;; prevent append multiple times
(defvar clean-buffer-list-kill-never-regexps-init
  clean-buffer-list-kill-never-regexps
  "Init value for clean-buffer-list-kill-never-regexps")
;; append to *-init instead of itself
(setq clean-buffer-list-kill-never-regexps
      (append '("^\\*EMMS Playlist\\*.*$")
              clean-buffer-list-kill-never-regexps-init))

;; To enable in all programming-related modes (Emacs 24+):
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;; disable set-mark
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)

(provide 't-basic)
