;;; t-looks.el --- 外观基础设置（现代化版）

;; 隐藏菜单栏、工具栏、滚动条（Windows/Mac/Linux 通杀）
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; 光标类型：bar（细竖线）
(setq-default cursor-type 'bar)

;; set font
(set-face-attribute 'default nil :font "Sarasa Mono SC SemiBold-15")  ; 英文/拉丁部分 height

;; fallback 确保万无一失（虽然 Sarasa SC 已经内置好）
(set-fontset-font t 'han "Sarasa Mono SC SemiBold-15")

;; 高亮当前行
(use-package hl-line
  :ensure t  ;; 内置，但保险
  :config
  (global-hl-line-mode 1)
  (set-face-background 'hl-line "gray13"))  ;; 深灰背景

;; 符号高亮（自动高亮光标下符号，超实用）
(use-package highlight-symbol
  :ensure t
  :config
  (setq highlight-symbol-idle-delay 0.5)  ;; 延迟 0.5s 高亮
  (highlight-symbol-mode t)
  ;; 键绑定（原 M-0 高亮符号）
  (global-set-key (kbd "M-0") 'highlight-symbol))

;; 删除原 dired+ use-package，换成这个内置增强
(add-hook 'dired-mode-hook 'dired-hide-details-mode)  ;; 初始隐藏细节，按 ( 切换显示
(setq dired-hide-details-hide-symlinks t
      dired-hide-details-hide-information-lines t)

(provide 't-looks)
;;; t-looks.el ends here
