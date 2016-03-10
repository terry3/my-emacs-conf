(el-get-bundle 'projectile)
(el-get-bundle 'helm-projectile)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(provide 't-projectile)
