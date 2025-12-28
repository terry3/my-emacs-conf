;;; t-edit.el --- 自定义编辑增强（现代化版）

;; 推荐 lexical-binding（现代 Emacs 标准，更安全）
;;; -*- lexical-binding: t -*-

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
  :bind (("C-," . avy-goto-char-timer))          ;; 你的首选：C-, 单字符跳（最快）
  :config
  ;; 美化+优化
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
(setq cua-keep-region-after-copy t)     ;; 复制后保持选区高亮
(setq cua-prefix-override-inhibit-delay 0.2)  ;; 更快响应
(cua-selection-mode t)  ;; 只用选区部分（如果不想全 cua 复制粘贴，可注释 cua-mode 1）

;; 可选：绑定 revert 无确认（你原文件有空 kbd，建议用 F5 或自定义）
(global-set-key (kbd "<f5>") 'terry3/revert-buffer-noconfirm)

;; 移除无用键（原文件有 M-c）
(global-unset-key (kbd "M-c"))

(provide 't-edit)
;;; t-edit.el ends here
