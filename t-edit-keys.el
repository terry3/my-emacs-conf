;; change buffer
(global-set-key (kbd "<f9>") 'previous-buffer)
(global-set-key (kbd "<f10>") 'next-buffer)

(require 'whole-line-or-region)

;; Some basic preferences
(setq-default
 blink-cursor-delay 0
 blink-cursor-interval 0.4
 bookmark-default-file "~/.emacs.d/.bookmarks.el"
 buffers-menu-max-size 30
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 grep-highlight-matches t
 grep-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 make-backup-files nil
 mouse-yank-at-point t
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 visible-bell t)

;; auto revert
(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

;; what's this?
(transient-mark-mode t)

;; goto line key
(global-set-key (kbd "C-'") 'goto-line)

;; require smartparens

;; 删除整行，不留下换行符
(setq kill-whole-line t)

(require 'expand-region)
(global-set-key (kbd "C-4") 'er/expand-region)


;; Rectangle selections, and overwrite text when the selection is active
(cua-selection-mode t)                  ; for rectangles, CUA is nice

;; set mark
(global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "C-x C-.") 'pop-global-mark)
(define-key global-map (kbd "RET") 'newline-and-indent)


;; ace jump
(require 'ace-jump-mode)
(global-set-key (kbd "C-;") 'ace-jump-mode)
(global-set-key (kbd "C-:") 'ace-jump-word-mode)

;;'M-w' copies the current line when the region is not active
;;'C-w' deletes it.
(whole-line-or-region-mode t)

;; maximize current windows
(global-set-key (kbd "<f1><f2>") 'delete-other-windows)

;; insert line before cur-line
(defun terry-insert-prev-line ()
  "insert a new indent line before current line, just like 'O' in vim"
  (interactive)
  (beginning-of-line)
  (newline-and-indent)
  (previous-line)
)
;; insert line after cur-line
(defun terry-insert-next-line ()
  "insert a new indent line after current line, just like 'o' in vim"
  (interactive)
  (end-of-line)
  (newline-and-indent))

(global-set-key (kbd "M-i") 'terry-insert-next-line)
(global-set-key (kbd "M-u") 'terry-insert-prev-line)

(provide 't-edit-keys)
