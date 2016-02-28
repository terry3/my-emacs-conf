;; set backup directory
(setq backup-by-copying t
      backup-directory-alist
      '(("." . "~/.emacs_backup")) ; Remember to modify this when change os.
      delete-old-versions t ; delete old version auto
      kept-new-versions 6 ; keep 6 backup
      kept-old-versions 2
      version-control t)
(provide 't-backup)
