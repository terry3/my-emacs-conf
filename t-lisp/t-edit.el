(el-get-bundle 'whole-line-or-region
  :url "https://raw.githubusercontent.com/purcell/whole-line-or-region/master/whole-line-or-region.el")
;;'M-w' copies the current line when the region is not active
;;'C-w' deletes it.
(whole-line-or-region-mode t)

;; smartparens
(el-get-bundle 'smartparens)
(smartparens-global-mode t)
(el-get-bundle 'smartparens-config
  :url "https://github.com/Fuco1/smartparens/blob/master/smartparens-config.el"
  (show-smartparens-global-mode t))

;; auto expand-region "auto-expand"
(el-get-bundle 'expand-region)
(global-set-key (kbd "C-0") 'er/expand-region)

;; Rectangle selections, and overwrite text when the selection is active
(cua-selection-mode t)                  ; for rectangles, CUA is nice

;; set mark
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-j") 'cua-set-mark)

;; ace jump
(el-get-bundle 'ace-jump-mode)
(global-set-key (kbd "C-,") 'ace-jump-mode)
;; When org-mode starts it (org-mode-map) overrides the ace-jump-mode.
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-,") 'ace-jump-mode)))


;; display file path & and
(global-set-key (kbd "<f12>")
                (lambda() (interactive) (message (buffer-file-name))))
;; revert current buffer
(global-set-key (kbd "<f5>") 'revert-buffer)

;; set key to cycle the windows
(global-set-key (kbd "M-`") 'other-window)

;; key bindings

(global-set-key (kbd "M-i") 'terry3/insert-next-line)
(global-set-key (kbd "M-u") 'terry3/insert-prev-line)
(global-set-key (kbd "C--") 'terry3/insert-timestamp)
;; comment current line
(global-set-key (kbd "M-l") 'terry3/toggle-comment-current-line)

(provide 't-edit)
;;; t-edit ends here
