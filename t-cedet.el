;; ;; Enable CEDET
;; (el-get-bundle 'cedet)
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion

;; (when (cedet-gnu-global-version-check t)
;;   (semanticdb-enable-gnu-global-databases 'c-mode)
;;   (semanticdb-enable-gnu-global-databases 'c++-mode))


;; ;; Semantic
;; (global-semantic-idle-completions-mode t)
;; (global-semantic-decoration-mode t)
;; (global-semantic-highlight-func-mode t)
;; (global-semantic-show-unmatched-syntax-mode t)
;; (global-semanticdb-minor-mode t)


;; ;; (setq semanticdb-project-roots (list (expand-file-name "/")))
;; (defconst cedet-user-include-dirs
;;   (list ".." "../include" "../inc" "../common" "../public"
;;         "../.." "../../include" "../../inc" "../../common" "../../public" "/usr/include"
;;         "/usr/local/include"
;;         "/home/terry3/terry3/code/github-out/libgit2/include"
;;         "/home/terry3/terry3/code/github-out/libgit2/include/git2"))
;; (defconst cedet-win32-include-dirs
;;   (list "C:/MinGW/include"
;;         "C:/MinGW/include/c++/3.4.5"
;;         "C:/MinGW/include/c++/3.4.5/mingw32"
;;         "C:/MinGW/include/c++/3.4.5/backward"
;;         "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
;;         "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))
;; (el-get-bundle 'semantic-c nil 'noerror)
;; (let ((include-dirs cedet-user-include-dirs))
;;   (when (eq system-type 'windows-nt)
;;     (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
;;   (mapc (lambda (dir)
;;           (semantic-add-system-include dir 'c++-mode)
;;           (semantic-add-system-include dir 'c-mode))
;;         include-dirs))

;; (global-set-key [f8] 'semantic-ia-fast-jump)
;; (defun my-c-mode-cedet-hook ()
;;  (local-set-key "." 'semantic-complete-self-insert)
;;  (local-set-key ">" 'semantic-complete-self-insert))
;; (add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)
(provide 't-cedet)
