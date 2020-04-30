;; set command as Meta key in OSX
(if (terry3/mac?)
    (progn
      (setq mac-option-key-is-meta nil)
      (setq mac-command-key-is-meta t)
      (setq mac-command-modifier 'meta)
      (setq mac-option-modifier nil)
      (setq visible-bell nil)      ;; workaround the visible-bell in OSX EI
      (setq ring-bell-function 'ignore)
      (set-default-font "Menlo 17")
      (setq-default line-spacing 5)))

(provide 't-mac)
