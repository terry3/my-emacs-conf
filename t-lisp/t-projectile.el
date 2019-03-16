(el-get-bundle 'projectile)
(el-get-bundle 'helm-projectile)

;; enalbe global
(projectile-global-mode)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;; set complete engine to helm
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(provide 't-projectile)
