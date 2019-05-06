;; config yasnippet
(el-get-bundle! 'yasnippet
  (yas-global-mode 1))
(el-get-bundle! AndreaCrotti/yasnippet-snippets
  (yas-reload-all))

(provide 't-yasnippet)
