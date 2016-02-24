;; hightlight
(el-get-bundle 'highlight-symbol)
(setq highlight-symbol-idle-delay 0.5)
(highlight-symbol-mode t)

(global-set-key (kbd "M-0") 'highlight-symbol)
(global-set-key (kbd "M-8") 'highlight-symbol-prev)
(global-set-key (kbd "M-9") 'highlight-symbol-next)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)

(provide 't-hl)

