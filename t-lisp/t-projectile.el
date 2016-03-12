(el-get-bundle 'projectile)
(el-get-bundle 'helm-projectile)

;; enalbe global
(projectile-global-mode)
;; set complete engine to helm
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(provide 't-projectile)
