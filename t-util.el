;; config ido
(require 'ido-ubiquitous)
(require 'smex)

;; (ido-mode t)
;; (ido-everywhere t)
;; (ido-ubiquitous-mode t)
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-filename-at-point nil)
;; (setq ido-auto-merge-work-directories-length 0)
;; (setq ido-use-virtual-buffers t)
;; find function
;; (global-set-key (kbd "M-x") 'smex)
;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

;; set default buffer file system coding
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

;; highlight sytax
;;(global-font-lock-mode t)

;; print the nice word
(defun terry-print-word ()
  "print the nice word"
  (interactive)
  (message (shell-command-to-string "random-time.pl")))

;; only in the terry's xubuntu
;; (global-set-key (kbd "<f8>") 'terry-print-word)

;; youdao dict
(defun terry-dict-youdao ()
  "query youdao dict from youdao api"
  (interactive)
  ;; read the input word
  (let (input-word shell-string)
    (setq input-word (read-from-minibuffer "Enter word: "))
    (setq shell-string (concat "youdao-perl.pl  " input-word))
    (message (shell-command-to-string shell-string)))
    )
;; only in the terry's xubuntu
;; (global-set-key (kbd "M-9") 'terry-dict-youdao)

(provide 't-util)
