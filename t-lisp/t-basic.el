;;; package --- basic configuration
;;; Commentary: basic
;; basic
(setq-default
 blink-cursor-delay 0
 blink-cursor-interval 0.4
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 indent-tabs-mode nil
 line-spacing 0.2
 show-trailing-whitespace t
 truncate-lines nil
 truncate-partial-width-windows nil)

;; set visual active
(transient-mark-mode t)

;; save desktop
(desktop-save-mode 1)

(defvar clean-buffer-list-timer nil
  "Stores clean-buffer-list timer if there is one. You can disable clean-buffer-list by (cancel-timer clean-buffer-list-timer).")

;; run clean-buffer-list every 2 hours
(setq clean-buffer-list-timer (run-at-time t 14400 'clean-buffer-list))

;; kill everything, clean-buffer-list is very intelligent at not killing
;; unsaved buffer.
;; (setq clean-buffer-list-kill-regexps '("^.*$"))

;; keep these buffer untouched
;; prevent append multiple times

;; prevent append multiple times
;; append to *-init instead of itself

;; To enable in all programming-related modes (Emacs 24+):
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(provide 't-basic)
;;; t-basic.el ends here
