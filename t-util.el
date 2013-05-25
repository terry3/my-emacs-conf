;; config ido
(require 'ido-ubiquitous)
(require 'smex)
(require 'idomenu)

(ido-mode t)
(ido-everywhere t)
(ido-ubiquitous-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length 0)
(setq ido-use-virtual-buffers t)
;; find function
(global-set-key (kbd "M-x") 'smex)
;; Allow the same buffer to be open in different frames
(setq ido-default-buffer-method 'selected-window)

;; set default coding
(setq default-buffer-file-coding-system 'utf-8)


(provide 't-util)
