;; set jump last position
;; (global-set-key (kbd "C-7") 'back-button-global-backward)
;; (global-set-key (kbd "C-8") 'back-button-global-forward)

;; set command as Meta key in OSX
(defun terry3-system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(if (terry3-system-is-mac)
    (progn      (setq mac-option-key-is-meta nil)
                (setq mac-command-key-is-meta t)
                (setq mac-command-modifier 'meta)
                (setq mac-option-modifier nil)))
(provide 't-keys)
