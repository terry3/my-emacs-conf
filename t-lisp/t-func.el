;;; t-func.el --- 通用函数库（现代化版）

;; -*- lexical-binding: t -*-

;; OS 判断函数（Windows/Linux/Mac 通杀）
(defun terry3/os-mac? () (eq system-type 'darwin))
(defun terry3/os-linux? () (eq system-type 'gnu/linux))
(defun terry3/os-windows? () (eq system-type 'windows-nt))

;; 全缓冲区 revert（无确认）
(defun terry3/revert-all-buffers ()
  "Revert all file buffers without confirmation."
  (interactive)
  (save-some-buffers t)  ;; 可选保存
  (mapc (lambda (buf)
          (when (buffer-file-name buf)
            (with-current-buffer buf
              (revert-buffer :ignore-auto :noconfirm))))
        (buffer-list))
  (message "All buffers reverted"))

;; 隐藏 DOS ^M 行尾
(defun terry3/hide-dos-eol ()
  "Hide ^M in DOS files."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; Hex 颜色高亮（#fff 变彩色，超实用）
(use-package rainbow-mode
  :ensure t
  :hook (prog-mode . rainbow-mode))  ;; 编程模式自动彩色 hex

;; Fullscreen 切换（内置，跨平台）
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)

;; 旧工具（youdao dict / cscope）——Windows 上可能无效，注释掉或删
;; (defun terry3/youdao-dict () ...)  ;; 注释
;; (defun terry3/update-cscope-db () ...)  ;; 注释

(provide 't-func)
;;; t-func.el ends here
