;; change buffer
(global-set-key (kbd "<f9>") 'back-button-global-backward)
(global-set-key (kbd "<f10>") 'back-button-global-forward)

(global-set-key (kbd "C-8") 'previous-buffer)
(global-set-key (kbd "C-7") 'next-buffer)
;; back-button控制windows的跳转
(require 'back-button)
(back-button-mode 1)

(require 'whole-line-or-region)
;;'M-w' copies the current line when the region is not active
;;'C-w' deletes it.
(whole-line-or-region-mode t)
;; kill line contain the 'return'
(setq kill-whole-line t)

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
; make-backup-files nil                    ;不开启备份
 mouse-yank-at-point t
 set-mark-command-repeat-pop t
 show-trailing-whitespace t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
; scroll-margin 5                       ;屏幕边缘5行滚动
 )


;; workaround the visible-bell in OSX Ei
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)


;; auto revert
;;(global-auto-revert-mode)
;;(setq global-auto-revert-non-file-buffers t
;;      auto-revert-verbose nil)

;; what's this?
(transient-mark-mode t)

;; goto line key
;; (global-set-key (kbd "C-'") 'goto-line)

;; require smartparens
(smartparens-global-mode t)
(require 'smartparens-config)
(show-smartparens-global-mode t)

;; auto expand-region "auto-expand"
(require 'expand-region)
(global-set-key (kbd "C-0") 'er/expand-region)

;; Rectangle selections, and overwrite text when the selection is active
(cua-selection-mode t)                  ; for rectangles, CUA is nice

;; set mark
;; (define-key global-map (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-j") 'cua-set-mark)
;; (global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "C-x C-.") 'pop-global-mark)

;; ace jump
(require 'ace-jump-mode)
(global-set-key (kbd "C-,") 'ace-jump-mode)
;; When org-mode starts it (org-mode-map) overrides the ace-jump-mode.
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-,") 'ace-jump-mode)))

;; maximize current window
(global-set-key (kbd "<f1><f2>") 'delete-other-windows)

;; insert line before cur-line
(defun terry-insert-prev-line ()
  "insert a new indent line before current line, just like 'O' in vim"
  (interactive)
  (beginning-of-line)
  (newline)
  (previous-line)
  (indent-for-tab-command)
)
;; insert line after cur-line
(defun terry-insert-next-line ()
  "insert a new indent line after current line, just like 'o' in vim"
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun terry-toggle-comment-current-line()
  "comment the current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(global-set-key (kbd "M-i") 'terry-insert-next-line)
(global-set-key (kbd "M-u") 'terry-insert-prev-line)

;; switch to other window
(global-set-key (kbd "<f11>") 'other-window)
;; display file path & and
(global-set-key (kbd "<f12>") (lambda() (interactive) (message (buffer-file-name))))

;; comment current line
(global-set-key (kbd "M-l") 'terry-toggle-comment-current-line)

;; undo-tree
;;(global-undo-tree-mode)

;; set refresh keys, reload current buffer
(defun refresh-file ()
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t))

(global-set-key (kbd "<f5>") 'refresh-file)
;; set key to cycle the windows
(global-set-key (kbd "M-`") 'other-window)


;; 重载所有打开文件的buffer
(defun revert-all-buffers ()
    "Refreshes all open buffers from their respective files."
    (interactive)
    (dolist (buf (buffer-list))
      (with-current-buffer buf
        (when (and (buffer-file-name) (file-exists-p (buffer-file-name)) (not (buffer-modified-p)))
          (revert-buffer t t t) )))
    (message "Refreshed open files.") )

;; define insert current timestamp
(defun terry-timestamp()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))
(global-set-key (kbd "C--") 'terry-timestamp)

(provide 't-edit-keys)

