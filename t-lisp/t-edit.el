;;; t-edit.el --- 自定义编辑增强（现代化版）

;; 推荐 lexical-binding（现代 Emacs 标准，更安全）
;;; -*- lexical-binding: t -*-

;; 创建备份文件目录（如果不存在）
(unless (file-exists-p "~/.emacs.d/backups")
  (make-directory "~/.emacs.d/backups" t))

(unless (file-exists-p "~/.emacs.d/autosaves")
  (make-directory "~/.emacs.d/autosaves" t))

;; 备份文件设置：所有备份放到 backups 目录
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; 备份方式优化
(setq backup-by-copying t)        ; 用复制方式备份（保留原文件权限）
(setq version-control t)          ; 启用版本控制（生成 filename~1~、~2~ 等）
(setq kept-new-versions 6)        ; 保留最新 6 个版本
(setq kept-old-versions 2)        ; 保留最早 2 个版本
(setq delete-old-versions t)      ; 自动删除多余旧版本
(setq vc-make-backup-files t)     ; 即使在版本控制下也备份

;; auto-save 文件（#filename#）也集中到 autosaves 目录
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/autosaves/" t)))
(setq auto-save-interval 300)     ; 每输入 300 个字符自动保存
(setq auto-save-timeout 30)       ; 空闲 30 秒自动保存

;; 优先使用 UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;; 额外保险（文件保存时强制 UTF-8）
(setq-default buffer-file-coding-system 'utf-8)

;; set windows clipborad code
(when (eq system-type 'windows-nt)
  (set-clipboard-coding-system 'utf-16le-dos)
  (setq selection-coding-system 'utf-16le-dos))

;; 设置语言环境
(set-language-environment "UTF-8")

;; 在当前行下插入新行并定位
(defun terry3/insert-next-line ()
  "Insert a new line below the current line and indent it."
  (interactive)
  (end-of-line)
  (newline-and-indent))

;; 在当前行上插入新行并定位
(defun terry3/insert-prev-line ()
  "Insert a new line above the current line and indent it."
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-according-to-mode))

;; 插入当前时间戳（格式：YYYY-MM-DD HH:MM:SS）
(defun terry3/insert-timestamp ()
  "Insert a timestamp at point."
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

;; 快速注释/取消注释当前行（或区域）
(defun terry3/toggle-comment-current-line ()
  "Toggle comment on the current line or region."
  (interactive)
  (let ((start (line-beginning-position))
        (end (line-end-position)))
    (when (region-active-p)
      (setq start (region-beginning)
            end (region-end)))
    (comment-or-uncomment-region start end)))

;; revert-buffer 无确认版（聪明处理改动）
(defun terry3/revert-buffer-noconfirm (&optional force-reverting)
  "Revert buffer without confirmation.
Ignore auto-save and don't ask. Refuse if buffer modified unless FORCE-REVERTING."
  (interactive "P")
  (if (or force-reverting (not (buffer-modified-p)))
      (progn
        (revert-buffer :ignore-auto :noconfirm)
        (message "Reverted file %s" (buffer-file-name)))
    (error "Buffer has been modified")))

;; Avy 跳光标神器（绑定 C-, 为主要跳字符，超级丝滑）
(use-package avy
  :ensure t
  :bind (("C-," . avy-goto-word-1))
  :config
  ;; 美化+优化
  ;; 2. 使用类似 ace-jump 的单字符提示风格（最接近原版 ace-jump-mode）
  (setq avy-style 'at)          ; 只在目标字符前显示一个提示键
  ;; 或者
  ;; (setq avy-style 'pre)         ; 提示键在目标前，视觉更清晰
  (setq avy-background t)                 ;; 跳时灰底高亮
  (setq avy-style 'at-full)               ;; 全屏提示
  (setq avy-all-windows t)                ;; 所有窗口跳
  (setq avy-timeout-seconds 0.5)          ;; 输入超时快点

  ;; 保险：Avy 激活时用单键（经典 ace-jump 风格）
  (avy-setup-default))


;; Whole Line or Region（无选区时自动操作整行，神器！）
(use-package whole-line-or-region
  :ensure t
  :diminish whole-line-or-region-local-mode
  :config
  ;; 全局启用（所有模式下生效）
  (whole-line-or-region-global-mode 1)

  ;; 可选优化（经典设置，避免意外）
  (setq whole-line-or-region-extensions-alist
        '((copy-region-as-kill whole-line-or-region-copy-region-as-kill nil)
          (kill-region whole-line-or-region-kill-region nil)
          (kill-ring-save whole-line-or-region-kill-ring-save nil)
          (yank whole-line-or-region-yank nil)
          (delete-region whole-line-or-region-delete-region nil))))

;; Expand Region（逐步扩展选区，神器！恢复原 C-0 绑定）
(use-package expand-region
  :ensure t
  :bind (("C-0" . er/expand-region))  ;; 你原爱的 C-0 逐步扩展
  :config
  ;; 可选优化（经典设置，扩展更智能）
  (setq expand-region-contract-fast-key "9")  ;; C-9 快速收缩（备选）
  (setq expand-region-reset-fast-key "r")     ;; r 重置选区
  ;; 连续按 C-0 扩展，超级顺手
  )

;; 全局键绑定
(global-set-key (kbd "M-i") 'terry3/insert-next-line)
(global-set-key (kbd "M-u") 'terry3/insert-prev-line)
(global-set-key (kbd "C--") 'terry3/insert-timestamp)
(global-set-key (kbd "M-l") 'terry3/toggle-comment-current-line)

;; CUA 模式增强（Windows 复制粘贴 + 快速选区，恢复原 C-j 绑定）
;; (cua-mode 1)  ;; 全局启用 cua-mode（Ctrl+C/V/X 复制粘贴剪切）

;; 恢复你原爱的 C-j 快速设 mark（激活 cua 选区行为）
(global-set-key (kbd "C-j") 'cua-set-mark)

;; 可选优化（经典配置，避免冲突 + 更好体验）
(setq cua-keep-region-after-copy nil)     ;; kill region after copy
(setq cua-prefix-override-inhibit-delay 0.2)  ;; 更快响应
(cua-selection-mode t)  ;; 只用选区部分（如果不想全 cua 复制粘贴，可注释 cua-mode 1）

;; 可选：绑定 revert 无确认（你原文件有空 kbd，建议用 F5 或自定义）
(global-set-key (kbd "<f5>") 'terry3/revert-buffer-noconfirm)

;; 移除无用键（原文件有 M-c）
(global-unset-key (kbd "M-c"))

(provide 't-edit)
;;; t-edit.el ends here
