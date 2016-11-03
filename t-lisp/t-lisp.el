;; (el-get-bundle slime)
;; (setq inferior-lisp-program "/usr/local/bin/sbcl")

(sp-with-modes sp--lisp-modes
  ;; disable ', it's the quote character!
  (sp-local-pair "'" nil :actions nil)
  ;; also only use the pseudo-quote inside strings where it serve as
  ;; hyperlink.
  (sp-local-pair "`" "'" :when '(sp-in-string-p sp-in-comment-p))
  (sp-local-pair "`" nil
                 :skip-match (lambda (ms mb me)
                               (cond
                                ((equal ms "'")
                                 (or (sp--org-skip-markup ms mb me)
                                     (not (sp-point-in-string-or-comment))))
                                (t (not (sp-point-in-string-or-comment)))))))

;; set complete source in emacs lisp
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((company-yasnippet
                    company-keywords
                    company-dabbrev-code
                    company-elisp)))))

;; set complete source in common lisp
(add-hook 'lisp-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '((company-yasnippet
                    company-keywords
                    company-dabbrev-code)))))

(provide 't-lisp)
