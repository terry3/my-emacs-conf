(el-get-bundle 'doom-themes
  (progn
    ;; (load-theme 'doom-one t)
    ;; (load-theme 'doom-vibrant t)
    ;; (load-theme 'doom-Iosvkem t)
    ;; (load-theme 'doom-challenger-deep t)
    ;; (load-theme 'doom-city-lights t)
    ;; (load-theme 'doom-dracula t)
    ;; (load-theme 'doom-molokai t)
    ;; (load-theme 'doom-nord-light t)
    (load-theme 'doom-nord t)
    ;; (load-theme 'doom-nova t)
    ;; (load-theme 'doom-one-light t)
    ;; (load-theme 'doom-one t)
    ;; (load-theme 'doom-opera-light t)
    ;; (load-theme 'doom-opera t)
    ;; (load-theme 'doom-peacock t)
    ;; (load-theme 'doom-solarized-light t)
    ;; (load-theme 'doom-sourcerer t)
    ;; (load-theme 'doom-spacegrey t)
    ;; (load-theme 'doom-tomorrow-day t)
    ;; (load-theme 'doom-tomorrow-night t)
    ;; (load-theme 'doom-vibrant t)
    ))

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

(provide 't-theme)
