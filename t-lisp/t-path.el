(el-get-bundle exec-path-from-shell
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(provide 't-path)
