;;; t-yasnippet.el --- Yasnippet 代码片段（现代化版）

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  ;; 全局启用（所有缓冲区可用）
  (yas-global-mode 1)

  ;; 加载官方全集片段（超多语言支持）
  (use-package yasnippet-snippets
    :ensure t
    :after yasnippet)

  ;; 自定义片段目录（你可以放自己的 .yas 文件）
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets"  ;; 自定义优先
          "~/.emacs.d/elpa/yasnippet-snippets-*/snippets"))  ;; 官方 fallback

  ;; Tab 展开（经典，但避免和公司补全冲突）
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-keymap (kbd "<tab>") nil)
  (define-key yas-keymap (kbd "TAB") nil)
  (global-set-key (kbd "C-c y n") 'yas-new-snippet)  ;; 新建片段
  (global-set-key (kbd "C-c y v") 'yas-visit-snippet-file)  ;; 编辑片段
  (global-set-key (kbd "C-c y r") 'yas-reload-all))  ;; 重载

(provide 't-yasnippet)
;;; t-yasnippet.el ends here
