;; terry3/func

(defun terry3/mac? ()
  "is current mac?"
  (interactive)
  (string-equal system-type "darwin"))

(defun terry3/win? ()
  "is current win?"
  (interactive)
  (string-equal system-type "windows-nt"))

;; insert line before cur-line
(defun terry3/insert-prev-line ()
  "insert a new indent line before current line, just like 'O' in vim"
  (interactive)
  (beginning-of-line)
  (newline)
  (previous-line)
  (indent-for-tab-command))
;; insert line after cur-line
(defun terry3/insert-next-line ()
  "insert a new indent line after current line, just like 'o' in vim"
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun terry3/toggle-comment-current-line()
  "comment the current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

;; set refresh keys, reload current buffer
(defun terry3/refresh-buffer ()
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t)
  (message "Reverted: %s" (buffer-file-name)))

;; revert all buffers
(defun terry3/revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name)
                 (file-exists-p (buffer-file-name))
                 (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files."))

;; define insert current timestamp
(defun terry3/insert-timestamp()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

;; set dired-detail always detail
;; print the nice word
(defun terry3/print-word ()
  "print the nice word"
  (interactive)
  (message (shell-command-to-string "random-time.pl")))

;; youdao dict
(defun terry3/dict-youdao ()
  "query youdao dict from youdao api"
  (interactive)
  ;; read the input word
  (let (input-word shell-string)
    (setq input-word (read-from-minibuffer "Enter word: "))
    (setq shell-string (concat "youdao-perl.pl  " input-word))
    (message (shell-command-to-string shell-string))))

(defun terry3/update-cscope-database ()
  "execute cscope -bRq command to update cscope database."
  (interactive)
  (message (shell-command-to-string "cscope -bRq")))

(defun terry3/toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(defun terry3/remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun terry3/hide-ctrl-M ()
  "Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun terry3/syntax-color-hex ()
  "Syntax color text of the form 「#ff1100」 and 「#abc」 in current buffer."
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[ABCDEFabcdef[:digit:]]\\{3\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background
                      (let* (
                       (ms (match-string-no-properties 0))
                       (r (substring ms 1 2))
                       (g (substring ms 2 3))
                       (b (substring ms 3 4)))
                  (concat "#" r r g g b b))))))
     ("#[ABCDEFabcdef[:digit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-fontify-buffer))

;; only in the terry's xubuntu
;; (global-set-key (kbd "<f8>") 'terry-print-word)

;; only in the terry's xubuntu
;; (global-set-key (kbd "M-9") 'terry-dict-youdao)

(provide 't-func)
