(el-get-bundle 'company-mode)

;; set popup delay to 0.1s
(setq company-idle-delay 0.1)
;; set to show numbers
(setq company-show-numbers t)

;; set global key to invoke complete popup window
(global-set-key (kbd "M-e") 'company-filter-candidates)

(provide 't-complete)
