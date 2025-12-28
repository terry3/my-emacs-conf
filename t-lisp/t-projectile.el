;;; t-projectile.el --- Projectile 项目管理（现代化版，与 Helm 完美集成）

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  ;; 全局启用
  (projectile-mode 1)

  ;; 项目根识别（经典 + 现代）
  (setq projectile-project-root-files
        '(".git" ".hg" ".svn" ".projectile" "package.json" "Cargo.toml" "Makefile"))

  ;; 忽略目录/文件（原味保留，Windows 上也防 node_modules 爆炸）
  (setq projectile-globally-ignored-directories
        (append '(".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_"
                  ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "node_modules" ".DS_Store")
                projectile-globally-ignored-directories))
  (setq projectile-globally-ignored-files
        (append '("*.pyc" "*~" "#*#" ".#*" "*.elc" "*.o" "*.obj" "*.exe")
                projectile-globally-ignored-files))

  ;; 缓存启用（加速）
  (setq projectile-enable-caching t
        projectile-indexing-method 'alien)  ;; Windows 上更快

  ;; 如果有 ripgrep（超快），优先用（Windows choco install ripgrep）
  (when (executable-find "rg")
    (setq projectile-generic-command "rg --files --hidden"))

  ;; 键前缀（经典 C-c p）
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; Helm + Projectile 深度集成（t-helm 已开，这里保险）
(use-package helm-projectile
  :ensure t
  :after projectile
  :config
  (helm-projectile-on)
  ;; 常用快捷（Helm 风格）
  (global-set-key (kbd "C-c p f") 'helm-projectile-find-file)
  (global-set-key (kbd "C-c p p") 'helm-projectile-switch-project)
  (global-set-key (kbd "C-c p s") 'helm-projectile-ag))  ;; 已在上个文件有，但强化

(provide 't-projectile)
;;; t-projectile.el ends here
