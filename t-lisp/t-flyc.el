;;; init-flycheck.el --- Configure Flycheck global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(el-get-bundle 'flycheck)
(require 'flycheck)
;; enable flycheck all the time
(add-hook 'after-init-hook 'global-flycheck-mode)
(setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(json-jsonlist)))
;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))

;; use eslint with web-mode for jsx files
;; (flycheck-add-mode 'html-tidy 'web-mode)
;; (flycheck-add-mode 'javascript-eslint 'web-mode)
(el-get-bundle 'flycheck-color-mode-line
  (require 'flycheck-color-mode-line)
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(provide 't-flyc)
;;; t-flyc.el ends here
