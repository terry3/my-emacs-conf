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

;; undo tree
(el-get-bundle! undo-tree
  (progn
    (global-undo-tree-mode)))

(defun marker-is-point-p (marker)
  "test if marker is current point"
  (and (eq (marker-buffer marker) (current-buffer))
       (= (marker-position marker) (point))))

(defun push-mark-maybe ()
  "push mark onto `global-mark-ring' if mark head or tail is not current location"
  (if (not global-mark-ring) (error "global-mark-ring empty")
    (unless (or (marker-is-point-p (car global-mark-ring))
                (marker-is-point-p (car (reverse global-mark-ring))))
      (push-mark))))

(defun backward-global-mark ()
  "use `pop-global-mark', pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark))

(defun forward-global-mark ()
  "hack `pop-global-mark' to go in reverse, pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (setq global-mark-ring (nreverse global-mark-ring))
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark)
  (setq global-mark-ring (nreverse global-mark-ring)))

(defun unpop-to-mark-command ()
  "Unpop off mark ring. Does nothing if mark ring is empty."
  (interactive)
      (when mark-ring
        (setq mark-ring (cons (copy-marker (mark-marker)) mark-ring))
        (set-marker (mark-marker) (car (last mark-ring)) (current-buffer))
        (when (null (mark t)) (ding))
        (setq mark-ring (nbutlast mark-ring))
        (goto-char (marker-position (car (last mark-ring))))))

(global-set-key (kbd "C-9") 'forward-global-mark)
(global-set-key (kbd "C-8") 'backward-global-mark)
(global-set-key (kbd "C-M-9") 'unpop-to-mark-command)
(global-set-key (kbd "C-M-8") 'pop-to-mark-command)

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

;; remove useless key binding
(global-unset-key (kbd "M-c"))

;; enable upcase-region
(put 'upcase-region 'disabled nil)

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
;;; t-edit ends here
