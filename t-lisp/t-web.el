(el-get-bundle 'web-mode
  (require 'web-mode))

;; format html/js/css
;; need 'npm install -g js-beautify'
(el-get-bundle 'yasuyk/web-beautify
  (require 'web-beautify))

(setq web-mode-enable-block-face t)
;; not auto indent
(setq web-mode-enable-auto-indentation nil)

;; let smartparens handle these
(setq web-mode-enable-auto-quoting nil
      web-mode-enable-auto-pairing t)

;; 1. Remove web-mode auto pairs whose end pair starts with a latter
;;    (truncated autopairs like <?p and hp ?>). Smartparens handles these
;;    better.
;; 2. Strips out extra closing pairs to prevent redundant characters
;;    inserted by smartparens.
(dolist (alist web-mode-engines-auto-pairs)
  (setcdr alist
          (cl-loop for pair in (cdr alist)
                   unless (string-match-p "^[a-z-]" (cdr pair))
                   collect (cons (car pair)
                                 (string-trim-right (cdr pair)
                                                    "\\(?:>\\|]\\|}\\)+\\'")))))

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.wxml?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.njk?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts?\\'" . web-mode))

(provide 't-web)
