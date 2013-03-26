;; some key setting
(defun terry-insert-prev-line ()
  "insert a new indent line before current line, just like 'O' in vim"
  (interactive)
  (previous-line)
  (end-of-line)
  (newline-and-indent))

(defun terry-insert-next-line ()
  "insert a new indent line after current line, just like 'o' in vim"
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun terry-copy (&optional arg)
  "terry-copy, copy line or region:
when mark-active, copy region;
or copy current line."
  (interactive "P")
  (if mark-active
      (kill-ring-save (region-beginning) (region-end))
    (let ((beg (progn (back-to-indentation) (point))) 
		  (end (line-end-position arg)))
      (copy-region-as-kill beg end))))
(defun terry-kill (&optional arg)
  "terry-kill, kill line or region:
when mark-active, kill region;
or kill current line."
  (interactive "P")
  (if mark-active
      (kill-region (region-beginning) (region-end))
    (kill-whole-line arg)))

(global-set-key (kbd "M-w") 'terry-copy)
(global-set-key (kbd "C-w") 'terry-kill)

(global-set-key (kbd "M-i") 'terry-insert-next-line)
(global-set-key (kbd "M-u") 'terry-insert-prev-line)



;; bracket matching
(show-paren-mode 1)
;; end

;; (x-display-pixel-width)
;; (x-display-pixel-height)


;; 图形化界面设置
;; 当为窗口化系统才启动
(if window-system
    (progn 
      (defun terry-resize-autoloc-frame (width height)
		"Set the width, height, and auto locate the frame in the middle of the screen."
		(let ((autox (/ (- (x-display-pixel-width) (* (frame-char-width) width)) 2))
			  (autoy (/ (- (x-display-pixel-height) (* (frame-char-height) height)) 2))
			  (frame (selected-frame)))
		  (delete-other-windows)
		  (set-frame-position frame autox 0)
		  (set-frame-size frame width height)))
   (defun terry-resize-frame (width hight x y)
		"Set the width, height, and x/y position of the current frame"
		(let ((frame (selected-frame)))
		  (delete-other-windows)
		  (set-frame-position frame x y)
		  (set-frame-size frame width hight)))
      (terry-resize-autoloc-frame 81 33)))

;;(terry-resize-autoloc-frame 81 30) 参数 为 col row

;; (- (x-display-pixel-height) (* (frame-char-height) 35) 2)
;; (x-display-pixel-height)
;; (frame-char-width)

;; 修改键值
;; 修改 自动换行的 命令
(global-set-key (kbd "C-/") 'toggle-truncate-lines)
;; 快捷跳转 buffer
(global-set-key (kbd "<f10>") 'next-buffer)
(global-set-key (kbd "<f9>") 'previous-buffer)

;; ibus-restart config
(load-file "~/.emacs.d/terry-lisp/ibus-restart.el")

;; 标记设置
(global-set-key (kbd "C-4") 'set-mark-command)
;; 设置 return 换行自动缩近 indent
(global-set-key (kbd "RET") 'newline-and-indent)
(global-unset-key (kbd "C-@"))
(global-unset-key (kbd "C-<SPC>"))
;; 结束

;; 设置 goto-line
(global-set-key (kbd "<f11>") 'goto-line)
;; 结束

;; 设置 当前窗口最大化
(global-set-key (kbd "<f1> <f2>") 'delete-other-windows)

;; 剪切版设置
(setq x-select-enable-clipboard t)
;; 结束

;; 关闭 emacs 启动画面
;;(setq inhibit-startups-creen t)
;; 指定 emacs 启动后打开的文件 或 目录
;;(setq initial-buffer-choice nil)

;; 设置 emacs 字体 
(set-default-font "SourceCodePro-13")
;; 结束
;; 配置  显示行号
(global-linum-mode 1)
;; 配置 el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)
;; 结束

;; 搞定 emacs 中文输入
(add-to-list 'load-path "~/.emacs.d/ibus-el-0.3.2/")
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
;; 结束

;; 高亮选中行 （太卡，关掉了）
;;(global-hl-line-mode t)
;;(set-face-background hl-line-face "grey1")
;; 结束

;; weibo
(add-to-list 'load-path "~/.emacs.d/weibo.emacs-master/")
(require 'weibo)
;; 结束

;; xcscope tags, find tags in c/c++
(require 'xcscope)
;; end

;; org-mode 7.9.2 /home/guotf/.emacs.d/org-7.9.2/lisp
(setq load-path (cons "/home/guotf/.emacs.d/org-7.9.2/lisp" load-path))
(setq load-path (cons "/home/guotf/.emacs.d/org-7.9.2/contrib/lisp" load-path))
(require 'org-install)
(require 'org-publish)
;; 当关闭 TODO 时会有关闭时间，并且可以写note
(setq org-log-done 'note)
;; org-mode 结束

;; 词典 sdcv 
(add-to-list 'load-path "~/.emacs.d/el-get/sdcv/");
(add-to-list 'load-path "~/.emacs.d/el-get/showtip/")

(require 'sdcv)
(setq sdcv-dictionary-simple-list        ;; a simple dictionary list
      '(
        "懒虫简明英汉词典"
        ))
(setq sdcv-dictionary-complete-list      ;; a complete dictionary list
      '(
        "牛津现代英汉双解词典"
        ))
(global-set-key (kbd "<f8>") 'sdcv-search-pointer+)
(global-set-key (kbd "<f7>") 'sdcv-search-pointer)
;; 结束


;; yasnippet 配置
(add-to-list 'load-path "~/.emacs.d/yasnippet/yasnippet/")
(require 'yasnippet)
(setq yas/snippet-dirs '("~/.emacs.d/yasnippet/yasnippet/snippets" "~/.emacs.d/yasnippet/yasnippet/extras/imported"))
(yas-global-mode 1)
;; 结束

;; slime common lisp 开发
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime")
;;(setq inferior-lisp-program "/usr/bin/clisp")  ;SBCL or Clisp
;;(require 'slime)
;;(slime-setup '(slime-fancy))
;; 结束

;; 开启 auto-complete
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete/")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/ac-dict/")

;; guotf的词典
(add-to-list 'ac-user-dictionary-files "~/.emacs.d/el-get/auto-complete/dict/guotf.dict")
(require 'auto-complete-config)
;; 结束

;; 配置 Perl AC
(add-hook 'perl-mode-hook
          (lambda()
            (require 'perl-completion)
            (perl-completion-mode t)))
;; 结束

;; 自动备份文件 至 ~/.emacs_backup 目录
(setq backup-by-copying t ; 自动备份
      backup-directory-alist
      '(("." . "~/.emacs_backup")) ; 自动备份在目录"~/.emacs_backup"下
      delete-old-versions t ; 自动删除旧的备份文件
      kept-new-versions 6 ; 保留最近的1个备份文件
      kept-old-versions 2 ; 保留最早的2个备份文件
      version-control t) ; 多次备份
;; 结束

;; 开启 auto-complete-clang
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete-clang/")
(require 'auto-complete-clang)  
;;(setq ac-clang-auto-save t)  
;; 设置不自动启动
(setq ac-auto-start nil)  
;; 设置响应时间 0.5
(setq ac-quick-help-delay 0.5)  
;;(ac-set-trigger-key "TAB")  
;;(define-key ac-mode-map  [(control tab)] 'auto-complete)  
;; 提示快捷键为 M-/
(define-key ac-mode-map  (kbd "M-/") 'auto-complete) 
(defun my-ac-config ()  
  (setq ac-clang-flags  
        (mapcar(lambda (item)(concat "-I" item))  
               (split-string  
                "
 /usr/include/c++/4.6
 /usr/include/c++/4.6/i686-linux-gnu/.
 /usr/include/c++/4.6/backward
 /usr/lib/gcc/i686-linux-gnu/4.6/include
 /usr/local/include
 /usr/lib/gcc/i686-linux-gnu/4.6/include-fixed
 /usr/include/i386-linux-gnu
 /usr/include
"
				)))  
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))  
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)  
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)  
  ;;  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)  
  ;;  (add-hook 'css-mode-hook 'ac-css-mode-setup)  
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)  
  (global-auto-complete-mode t))  
(defun my-ac-cc-mode-setup ()  
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))  
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)  
;; ac-source-gtags  
(my-ac-config)  
(ac-config-default)
;; 结束

;; 改变emacs标题栏的标题
(setq frame-title-format "%b:_terry3")

;; 允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;; 显示列号
(setq column-number-mode t)

;;设置tab为4个空格的宽度
(setq default-tab-width 4)
(setq c-basic-offset 4)
(setq c-default-style "linux")

;; perl 模式下 indent 为 2
(setq perl-indent-level 2)

;; 去掉工具栏
(tool-bar-mode -1)
;; 菜单栏
;;(menu-bar-mode nil)

;; 滚动栏
(scroll-bar-mode nil)
;; 结束

;; 配置 evil vim-mode
;;(add-to-list 'load-path "~/.emacs.d/el-get/evil/")
;;(require 'evil)
;;(evil-mode 1)
;; 结束

;; 导入 el-get 目录
(let ((default-directory "~/.emacs.d/el-get/"))
  (normal-top-level-add-subdirs-to-load-path))
;; 结束

;; 配置 color-theme
(add-to-list 'load-path "~/.emacs.d/el-get/color-theme/")

;; 开启 color-theme
;;(color-theme-subtle-hacker)
;;(color-theme-zen-and-art)
;;(color-theme-twilight)
;;(color-theme-gnome2)
;;(color-theme-solarized-dark)

;; open it to use color-theme
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-tangotango)

(require 'birds-of-paradise-plus-theme)
(load-theme birds-of-paradise-plus t)
;; 结束

;; Interactive Do Things 插件，很给力的插件
(add-to-list 'load-path "~/.emacs.d/Interactively Do Things")
(setq idog-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(require 'ido)
;; 结束

;; 定义模版
(add-to-list 'load-path "~/.emacs.d/template/")
(require 'template)
;; 必须这么指定 搜索目录，蛋疼
(setq template-subdirectories '("~/.emacs.d/template/templates"))
(setq template-auto-insert t)
(template-initialize)
(add-to-list 'template-find-file-commands
             'ido-exit-minibuffer)
;; 结束

;; emacs 内置配置
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(kill-do-not-save-duplicates t)
 '(org-startup-with-inline-images n)
;; '(org-export-html-style-include-default nil)
 '(org-time-stamp-custom-formats (quote ("<%m/%d/%y %a %H:%M>" . "<%m/%d/%y %a %H:%M>")))
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; 结束

;; pymacs 设置

;; pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

;; ropemacs
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
;; pymacs end


;; other .el files add here
;; end

;; '(org-export-html-style-include-default nil)

;; 一些让朕解禁的 命令
;; 横向滑动
(put 'scroll-left 'disabled nil)
;; 将区域内字符小写
(put 'downcase-region 'disabled nil)
;; 将区域内字符大写
(put 'upcase-region 'disabled nil)

;; rect-mark 
(add-to-list 'load-path "~/.emacs.d/el-get/rect-mark")
(global-set-key (kbd "C-x r C-v") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)

;; cedet 语法补全
;; (load-file "~/.emacs.d/cedet-1.1/common/cedet.el")
;; (global-ede-mode 1)                      ; Enable the Project management system
;; (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
;; (require 'semantic-gcc)

;; ;; 自定义 auto-complete 的补全，将 buffer 提示，改为 tips 提示
;; (defun ac-complete-semantic-self-insert (arg)
;;     (interactive "p")
;;     (self-insert-command arg)
;;     (ac-complete-semantic))

;; ;; 将提示函数，加入到 c-mode-common-hook 中
;; (defun my-c-mode-cedet-hook ()
;; ;;(local-set-key (kbd "C-c .") 'ac-complete-semantic)
;; (local-set-key "." 'ac-complete-semantic-self-insert)
;; (local-set-key ">" 'ac-complete-semantic-self-insert))
;; (add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook)

;; desktop.el 保存工作环境
(require 'desktop)
(desktop-save-mode 1)
;; 当 new 时 询问是否 保存 desktop
(setq desktop-save 'ask-if-new)
;; 结束

;; sessionl.el 保存工作环境
(require 'session)
(setq desktop-globals-to-save '(desktop-missing-file-warning))
;; 防止 org-mode 死循环?
(add-to-list 'session-globals-exclude
             'org-mark-ring)
;; 结束

;; jekyll org-mode 导出 html
(setq org-publish-project-alist
      '(
		("org-ianbarton"
		 ;; Path to your org files.
		 :base-directory "~/blog/"
		 :base-extension "org"

		 ;; Path to your Jekyll project.
		 :publishing-directory "~/soft/jekyll-org/"
		 :recursive t
		 :publishing-function org-publish-org-to-html
		 :headline-levels 4 
		 :html-extension "html"
		 :body-only t ;; Only export section between <body> </body>
		 )
		("org-static-ian"
		 :base-directory "~/blog/"
		 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|php"
		 :publishing-directory "~/blog/_site"
		 :recursive t
		 :publishing-function org-publish-attachment)

		("ian" :components ("org-ianbarton" "org-static-ian"))
		))

(provide 'terry)
