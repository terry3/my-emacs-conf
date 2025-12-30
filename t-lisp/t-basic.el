;;; t-basic.el --- 基础编辑设置（现代化版）

;; 经典编辑偏好（从原文件迁移）
(setq-default
 blink-cursor-delay 0
 blink-cursor-interval 0.4
 case-fold-search t
 column-number-mode t
 compilation-scroll-output t
 indent-tabs-mode nil
 line-spacing 0
 show-trailing-whitespace t
 truncate-lines nil
 truncate-partial-width-windows nil)

;; 高亮选中区域（现代 Emacs 默认已开，可选保留）
(transient-mark-mode 1)

;; 保存桌面会话（恢复上次打开的缓冲区）
(use-package desktop
  :ensure t  ;; 内置，但 ensure 保险
  :config
  (desktop-save-mode 1)
  (setq desktop-path '("~/.emacs.d/"))  ;; Windows 上安全路径
  (setq desktop-save t)
  (add-to-list 'desktop-modes-not-to-save 'dired-mode))  ;; 可选

;; 自动清理旧缓冲区（用内置 midnight-mode 替代 clean-buffer-list）
(use-package midnight
  :defer 10
  :config
  (midnight-mode 1)
  (setq clean-buffer-list-delay-general 7200)  ;; 调成 2 小时（原意），或改成 14400=4小时
  (setq clean-buffer-list-kill-buffer-names
        '("*scratch*" "*Messages*" "*Help*"))
  (setq clean-buffer-list-kill-never-buffer-names
        '("*scratch*" "*Messages*")))

;; 彩虹括号（编程模式下超实用）
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 't-basic)
;;; t-basic.el ends here
