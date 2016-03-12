(el-get-bundle 'company-mode
  (progn
    (require 'company)))

(el-get-bundle 'company-statistics
  (require 'company-statistics)
  (company-statistics-mode))

;; set company-mode variables
(setq company-idle-delay 0.1           ; set popup delay to 0.1s
      company-show-numbers t           ; set to show numbers
      company-minimum-prefix-length 1) ; start complete when type just 1 character

;; set global key to invoke complete popup window
(global-set-key (kbd "M-e") 'company-filter-candidates)

;; enable global company-mode
(global-company-mode)

(provide 't-complete)
