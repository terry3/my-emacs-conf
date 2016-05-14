(el-get-bundle dash)
(el-get-bundle helm)
(el-get-bundle helm-config
  :url "https://github.com/emacs-helm/helm/blob/master/helm-config.el")
(el-get-bundle helm-ag)

;;; Enable Modes (This is loading nearly everything).
;;
(helm-mode 1)
(helm-adaptive-mode 1)
;;(helm-autoresize-mode 1)
(helm-push-mark-mode 1)

;;; Global-map
;;
;;
(global-set-key (kbd "M-x")                          'undefined)
(global-set-key (kbd "M-x")                          'helm-M-x)
(global-set-key (kbd "M-y")                          'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f")                      'helm-find-files)
(global-set-key (kbd "C-c <SPC>")                    'helm-all-mark-rings)
(global-set-key (kbd "C-x r b")                      'helm-filtered-bookmarks)
(global-set-key (kbd "C-h r")                        'helm-info-emacs)
(global-set-key (kbd "C-h i")                        'helm-info-at-point)
(global-set-key (kbd "C-x C-d")                      'helm-browse-project)
(global-set-key (kbd "M-3")                          'helm-resume)
(global-set-key (kbd "C-h C-f")                      'helm-apropos)
(global-set-key (kbd "C-h a")                        'helm-apropos)
(global-set-key (kbd "<f2>")                         'helm-execute-kmacro)
(global-set-key (kbd "C-c i")                        'helm-imenu-in-all-buffers)
(global-set-key (kbd "C-s")                          'helm-occur)

(define-key global-map [remap jump-to-register]      'helm-register)
;;(define-key global-map [remap list-buffers]          'helm-buffers-list)
(define-key global-map [remap dabbrev-expand]        'helm-dabbrev)
(define-key global-map [remap find-tag]              'helm-etags-select)
(define-key global-map [remap xref-find-definitions] 'helm-etags-select)
(define-key helm-map (kbd "C-i")   'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")   'helm-select-action) ; list actions using C-z
(define-key global-map (kbd "M-g a")                 'helm-do-grep-ag)

;;; Helm-variables
(setq helm-google-suggest-use-curl-p             t
      helm-raise-command                         "wmctrl -xa %s"
      ;helm-kill-ring-threshold                   1
      helm-scroll-amount                         4
      helm-quick-update                          t
      helm-idle-delay                            0.01
      helm-input-idle-delay                      0.01
      ;helm-completion-window-scroll-margin       0
      ;helm-display-source-at-screen-top          nil
      helm-ff-search-library-in-sexp             t
      ;helm-kill-ring-max-lines-number            5
      ;helm-default-external-file-browser         "thunar"
      ;helm-pdfgrep-default-read-command          "evince --page-label=%p '%f'"
      ;helm-ff-transformer-show-only-basename     t
      helm-ff-auto-update-initial-value          t
      helm-grep-default-command                  "ggrep --color=always -d skip %e -n%cH -e %p %f"
      helm-grep-default-recurse-command          "ggrep --color=always -d recurse %e -n%cH -e %p %f"
      ;; Allow skipping unwanted files specified in ~/.gitignore_global
      ;; Added in my .gitconfig with "git config --global core.excludesfile ~/.gitignore_global"
      helm-ls-git-grep-command                   "git grep -n%cH --color=always --exclude-standard --no-index --full-name -e %p %f"
      helm-default-zgrep-command                 "zgrep --color=always -a -n%cH -e %p %f"
      ;helm-pdfgrep-default-command               "pdfgrep --color always -niH %s %s"
      ;helm-reuse-last-window-split-state         t
      helm-split-window-default-side             'above
      ;helm-split-window-in-side-p                t
      helm-echo-input-in-header-line             t
      helm-always-two-windows                    t
      ;helm-persistent-action-use-special-display t
      helm-buffers-favorite-modes                (append helm-buffers-favorite-modes
                                                         '(picture-mode artist-mode))
      helm-ls-git-status-command                 'magit-status
      ;helm-never-delay-on-input                  nil
      helm-candidate-number-limit                500
      helm-M-x-requires-pattern                  0
      helm-dabbrev-cycle-threshold                5
      ;helm-surfraw-duckduckgo-url                "https://duckduckgo.com/?q=%s&ke=-1&kf=fw&kl=fr-fr&kr=b&k1=-1&k4=-1"
      ;helm-surfraw-default-browser-function      'w3m-browse-url
      helm-boring-file-regexp-list               '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$")
      ;helm-mode-handle-completion-in-region      t
      helm-moccur-always-search-in-current        t
      ;helm-tramp-verbose                         6
      helm-buffer-skip-remote-checking            t
      ;helm-ff-file-name-history-use-recentf      t
      helm-follow-mode-persistent                 t
      helm-apropos-fuzzy-match                    t
      helm-M-x-fuzzy-match                        t
      helm-lisp-fuzzy-completion                  t
      helm-recentf-fuzzy-match                    t
      ;helm-locate-fuzzy-match                     t
      helm-completion-in-region-fuzzy-match       t
      helm-move-to-line-cycle-in-source           t
      ido-use-virtual-buffers                     t             ; Needed in helm-buffers-list
      helm-tramp-verbose                          6
      helm-buffers-fuzzy-matching                 t
      helm-locate-command                         "locate %s -e -A --regex %s"
      helm-org-headings-fontify                   t
      ;; helm-autoresize-max-height                  40 ; it is %.
      ;; helm-autoresize-min-height                  20 ; it is %.
      ;; helm-buffers-to-resize-on-pa                '("*helm apropos*" "*helm ack-grep*"
      ;;                                               "*helm grep*" "*helm occur*" "*helm ag*"
      ;;                                               "*helm multi occur*" "*helm lsgit*" "*helm occur*"
      ;;                                               "*helm git-grep*" "*helm hg files*"
      ;;                                               "*helm imenu*" "*helm imenu all*"
      ;;                                               "*helm gid*" "*helm semantic/imenu*")
      fit-window-to-buffer-horizontally           1
      helm-open-github-closed-issue-since         7
      helm-search-suggest-action-wikipedia-url
      "https://en.wikipedia.org/wiki/Special:Search?search=%s"
      helm-wikipedia-suggest-url
      "http://en.wikipedia.org/w/api.php?action=opensearch&search="
      helm-wikipedia-summary-url
      "http://en.wikipedia.org/w/api.php?action=parse&format=json&prop=text&section=0&page=")

;; set helm-ls-git
(el-get-bundle 'helm-ls-git)

;; enable follow mode
(defmethod helm-setup-user-source ((source helm-source-multi-occur))
  (oset source :follow 1))

(provide 't-helm)
