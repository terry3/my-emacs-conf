;; -*- lexical-binding: t -*-

;; 加快启动：early-init 如果需要可以单独建
(setq gc-cons-threshold most-positive-fixnum
      package-native-compile t)

;; 包源
(require 'package)
(setq package-archives
      '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
        ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

;; use-package 安装
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; 你的自定义路径
(add-to-list 'load-path "~/.emacs.d/t-lisp")

;; 尝试加载你的旧模块（如果报错就注释掉对应行）
(require 't-basic nil t)
(require 't-func nil t)
(require 't-edit nil t)
(require 't-looks nil t)
(require 't-theme nil t)
(require 't-helm nil t)
(require 't-projectile nil t)
(require 't-yasnippet nil t)
;; ... 其他你需要的 t-xxx，逐个试

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(avy doom-themes flycheck helm-ls-git helm-projectile
         highlight-symbol js2-mode lsp-mode rainbow-delimiters
         rainbow-mode web-mode whole-line-or-region yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-unset-key (kbd "C-SPC")) ; 取消C-SPC的默认绑定
(global-set-key (kbd "M-SPC") 'set-mark-command) ; 绑定M-SPC (Alt+Space)
