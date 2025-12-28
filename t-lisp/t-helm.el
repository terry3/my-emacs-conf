;;; t-helm.el --- Helm 配置（原味保留所有快捷键 + helm-rg 替代）

(use-package helm
  :ensure t
  :diminish helm-mode
  :config
  ;; 原变量设置全保留（模糊、header-line、候选数等经典）
  (setq helm-google-suggest-use-curl-p t
        helm-scroll-amount 4
        helm-quick-update t
        helm-idle-delay 0.01
        helm-input-idle-delay 0.01
        helm-ff-search-library-in-sexp t
        helm-ff-auto-update-initial-value t
        helm-grep-git-grep-command "git grep -n%cH --color=always --exclude-standard --no-index --full-name -e %p %f"
        helm-grep-default-command-windows-nt "rg --no-heading --color=always --smart-case --line-number %e %p %f"
        helm-split-window-default-side 'above
        helm-echo-input-in-header-line t
        helm-always-two-windows t
        helm-candidate-number-limit 500
        helm-M-x-requires-pattern 0
        helm-dabbrev-cycle-threshold 5
        helm-boring-file-regexp-list '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$")
        helm-moccur-always-search-in-current t
        helm-buffer-skip-remote-checking t
        helm-follow-mode-persistent t
        helm-apropos-fuzzy-match t
        helm-M-x-fuzzy-match t
        helm-lisp-fuzzy-completion t
        helm-recentf-fuzzy-match t
        helm-locate-fuzzy-match t
        helm-completion-in-region-fuzzy-match t
        helm-move-to-line-cycle-in-source t
        ido-use-virtual-buffers t
        helm-tramp-verbose 6
        helm-buffers-fuzzy-matching t
        helm-org-headings-fontify t
        helm-find-noerrors t
        fit-window-to-buffer-horizontally 1
        helm-open-github-closed-issue-since 7)

  ;; 纯 Helm 内置 grep 用 rg backend（零新包，界面/操作 100% 原 Helm）
  (setq helm-grep-use-ioccur-style-keys t)  ;; ioctur 风格快捷（熟悉）
  (setq helm-grep-file-path-style 'relative)
  (setq helm-grep-ag-command "d:/home/soft/rg.exe --vimgrep --color=never --smart-case --no-heading --hidden --line-number %s %s %s")
  (setq helm-grep-ag-pipe-cmd nil)  ;; 可选：颜色处理（Windows 有时需）

  ;; 用你 rg 全路径保险（避免任何查找问题）
  (setq helm-grep-default-command "d:/home/soft/rg.exe --vimgrep --color=never --smart-case --no-heading --hidden --line-number %s %s %s")
  (setq helm-grep-default-directory-command "d:/home/soft/rg.exe --files")

  ;; 绑定原 M-g a 到 Helm 内置 rg grep（全局/目录搜索）
  (global-set-key (kbd "M-g a") 'helm-do-grep-ag)

  ;; 可选：项目内用 projectile + Helm rg
  (setq projectile-ripgrep-command "d:/home/soft/rg.exe --vimgrep --color=always --smart-case $OPT $PAT $FILES")
  (global-set-key (kbd "C-c p s") 'helm-projectile-grep)  ;; 如果想项目专用

  ;; find-file-hook 原保留
  (add-hook 'find-file-hook 'helm-save-current-pos-to-mark-ring)

  ;; 原所有快捷键一个不改！
  (global-set-key (kbd "C-x r y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x r Y") 'helm-all-mark-rings)
  (global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
  (global-set-key (kbd "C-h r") 'helm-info-emacs)
  (global-set-key (kbd "C-h i") 'helm-info-at-point)
  (global-set-key (kbd "C-x C-d") 'helm-browse-project)
  (global-set-key (kbd "M-3") 'helm-resume)
  (global-set-key (kbd "C-h C-f") 'helm-apropos)
  (global-set-key (kbd "C-h a") 'helm-apropos)
  (global-set-key (kbd "C-c i") 'helm-imenu-in-all-buffers)
  (global-set-key (kbd "C-s") 'helm-occur)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x b") 'helm-mini)

  (define-key global-map [remap jump-to-register] 'helm-register)
  (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
  (define-key global-map [remap find-tag] 'helm-etags-select)
  (define-key global-map [remap xref-find-definitions] 'helm-etags-select)

  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
  (define-key helm-map (kbd "C-z") 'helm-select-action)

  ;; 原 helm-mode（如果有，保险加）
  (helm-mode 1))

;; helm-rg 替代 helm-do-grep-ag（绑定不变：M-g a 还是 grep）
(when (eq system-type 'windows-nt)
  ;; 加 rg 目录到 exec-path（Emacs 找可执行用）
  (add-to-list 'exec-path "D:/home/soft")  ;; choco 默认 rg 路径，改成你的如果不同

  ;; 同步系统 PATH 到 Emacs 环境（关键！GUI Emacs 默认 PATH 空）
  (let ((new-path (concat "D:/home/soft;" (getenv "PATH"))))
    (setenv "PATH" new-path)
    (setq exec-path (append exec-path (split-string new-path path-separator)))))

;; 测试 rg 是否认到（可选，放 init.el 测试，重启看 *Messages*）
(message "rg path test: %s" (executable-find "rg"))

;; 原 helm-ls-git
(use-package helm-ls-git
  :ensure t
  :after helm)

(use-package helm-projectile
  :ensure t
  :after (helm projectile)
  :config
  (helm-projectile-on))

(provide 't-helm)
;;; t-helm.el ends here
