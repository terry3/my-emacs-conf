(el-get-bundle 'company-mode
  (progn
    (require 'company)))

(el-get-bundle 'company-statistics
  (require 'company-statistics)
  (company-statistics-mode))

;; set popup delay to 0.1s
(setq company-idle-delay 0.1)
;; set to show numbers
(setq company-show-numbers t)

;; set global key to invoke complete popup window
(global-set-key (kbd "M-e") 'company-filter-candidates)

;; start complete when type just 1 character
(setq company-minimum-prefix-length 1)

(global-company-mode)
(provide 't-complete)
