;; �Զ������ļ� �� ~/.emacs_backup Ŀ¼
(setq backup-by-copying t ; �Զ�����
      backup-directory-alist
      '(("." . "/home/terry3/.emacs_backup")) ;�Զ�������Ŀ¼"~/.emacs_backup"��
      delete-old-versions t ; �Զ�ɾ���ɵı����ļ�
      kept-new-versions 6 ; ���������1�������ļ�
      kept-old-versions 2 ; ���������2�������ļ�
      version-control t) ; ��α���
;; ����

(provide 't-backup)
