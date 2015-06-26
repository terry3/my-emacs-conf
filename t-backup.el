;; 自动备份文件 至 ~/.emacs_backup 目录
(setq backup-by-copying t ; 自动备份
      backup-directory-alist
      '(("." . "/home/terry3/.emacs_backup")) ;自动备份在目录"~/.emacs_backup"下
      delete-old-versions t ; 自动删除旧的备份文件
      kept-new-versions 6 ; 保留最近的1个备份文件
      kept-old-versions 2 ; 保留最早的2个备份文件
      version-control t) ; 多次备份
;; 结束

(provide 't-backup)
