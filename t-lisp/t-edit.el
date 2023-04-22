;;; package --- Summary:
;;; Commentary:
;;; Code:

(el-get-bundle 'purcell/whole-line-or-region
  (require 'whole-line-or-region)
  (setq kill-whole-line t))
;; 'M-w' copies the current line when the region is not active
;; 'C-w' deletes it.


;; set no backup files
(setq make-backup-files nil)

(global-set-key (kbd "C-0") 'er/expand-region)

;; Rectangle selections, and overwrite text when the selection is active
(cua-selection-mode t) ; for rectangles, CUA is nice

;; set mark
(global-set-key (kbd "RET") 'newline)
(global-set-key (kbd "C-j") 'cua-set-mark)

;; ace jump
(el-get-bundle 'ace-jump-mode)
(global-set-key (kbd "C-,") 'ace-jump-mode)

;; display file path & and
(global-set-key (kbd "<f12>")
                (lambda() (interactive) (message (buffer-file-name))))
;; revert current buffer
(global-set-key (kbd "<f5>") 'revert-buffer)

;; key bindings
(global-set-key (kbd "M-i") 'terry3/insert-next-line)
(global-set-key (kbd "M-u") 'terry3/insert-prev-line)
(global-set-key (kbd "C--") 'terry3/insert-timestamp)
;; comment current line
(global-set-key (kbd "M-l") 'terry3/toggle-comment-current-line)

;; remove useless key binding
(global-unset-key (kbd "M-c"))

;; revert buffer no confirm
(global-set-key
 (kbd "<f5>")
 (lambda (&optional force-reverting)
   "Interactive call to revert-buffer. Ignoring the auto-save
 file and not requesting for confirmation. When the current buffer
 is modified, the command refuses to revert it, unless you specify
 the optional argument: force-reverting to true."
   (interactive "P")
   ;;(message "force-reverting value is %s" force-reverting)
   (if (or force-reverting (not (buffer-modified-p)))
       (progn
         (revert-buffer :ignore-auto :noconfirm)
         (message "revert file %s" (buffer-file-name)))
     (error "The buffer has been modified"))))

(provide 't-edit)
;;; t-edit.el ends here
