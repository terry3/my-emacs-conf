;;; t-theme.el --- 主题设置（现代化版）

(use-package doom-themes
  :ensure t
  :config
  ;; 全局设置
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)

  ;; 加载你喜欢的主题（原 doom-dracula，血红经典！可换其他）
  (load-theme 'doom-dracula t)

  ;; 错误时 mode-line 闪铃（视觉铃声）
  (doom-themes-visual-bell-config)

  ;; Neotree 主题（如果用 neotree，需安装 all-the-icons）
  ;; (doom-themes-neotree-config)

  ;; Org-mode 更好字体高亮
  (doom-themes-org-config))

(provide 't-theme)
;;; t-theme.el ends here
