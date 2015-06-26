(require 'auto-complete)
(require 'auto-complete-config)
;; (global-auto-complete-mode t)
;; (setq ac-expand-on-auto-complete nil)
;; (setq ac-auto-start nil)
(setq ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed
;; (ac-set-trigger-key "TAB")
;; (define-key ac-completing-map (kbd "C-n") 'ac-next)
;; (define-key ac-completing-map (kbd "C-p") 'ac-previous)

;; ;;----------------------------------------------------------------------------
;; ;; Use Emacs' built-in TAB completion hooks to trigger AC (Emacs >= 23.2)
;; ;;----------------------------------------------------------------------------
;; (setq tab-always-indent 'complete)  ;; use 't when auto-complete is disabled
(add-to-list 'completion-styles 'initials t)
;; ;;(setq ac-auto-start t)
(setq ac-delay 0.1)
(setq ac-quick-help-delay 0.1)
;; ;; hook AC into completion-at-point
;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions '(auto-complete)))
;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)

(setq  ac-sources
      '(ac-source-imenu
;        ac-source-dictionary
        ac-source-words-in-buffer
        ac-source-words-in-same-mode-buffers
;        ac-source-words-in-all-buffer
;        ac-source-semantic
        ac-source-yasnippet))

(defun my-ac-config ()
  (setq ac-clang-flags)
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
;; ac-source-gtags
(my-ac-config)
(global-auto-complete-mode t)
(define-key ac-mode-map (kbd "M-e") 'auto-complete)

(provide 't-ac)
