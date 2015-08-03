(require 'dired+)
;; set emacs title
(setq frame-title-format "%f:_terry3")
;; set system clip
(setq x-select-enable-clipboard t)
;; display column number
(setq column-number-mode t)
;; tab = 4 blank
(setq default-tab-width 4)
(setq c-basic-offset 4)
(setq c-default-style "K&R")

;; delete tool bar
(menu-bar-showhide-tool-bar-menu-customize-disable)
;; delete scroll bar
(menu-bar-no-scroll-bar)

;; 设置光标为竖线
(setq-default cursor-type 'bar)
;; 设置光标为方块
;;(setq-default cursor-type 'box)

;; set emacs font, encod
;;(set-frame-font "Ubuntu mono 14")
;;(set-fontset-font "fontset-default" 'han '("微软雅黑"))
(set-default-font "Ubuntu Mono 15")
;; (set-default-font "Consolas 14")

;; powerline
;; not good
;; (require 'powerline)

;; Begin: set emacs full screen 2013-09-29
(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))
;; End: set emacs full screen 2013-09-29
;; (toggle-fullscreen)
;; End: set emacs full screen

;; (setq default-frame-alist
;; '((height . 33)
;;   (width . 80)
;;   ;;(menu-bar-lines . 20)
;;   ;;(tool-bar-lines . 0)
;;   ))

;; set system contidion
;;(if (eq system-type 'windows-nt)
;; set emacs window size
(if (eq system-type 'windows-nt)
    (progn (set-frame-width (selected-frame) 80)
     (set-frame-height (selected-frame) 32)
     (set-frame-position (selected-frame) 300 3)))

;; set emacs fullscreen
;; (if (eq system-type 'windows-nt)
;;     (w32-send-sys-command 61488))

;; sr-speedbar
;;(require 'sr-speedbar)
;; show when emacs start
;;(add-hook 'after-init-hook '(lambda () (sr-speedbar-toggle)))
;; (global-set-key (kbd "C-9") 'sr-speedbar-select-window)

(require 'highlight)
;; really shit in windows
;; (require 'powerline)

;; turn on highlighting current line
(global-hl-line-mode 1)

(defun remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun hide-ctrl-M ()
  "Hides the disturbing '^M' showing up in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

;; set emacs split windows horizontally  default
(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; set emacs to reuse windows
;;;---------------------------------------------------------------------
;;; display-buffer
;; The default behaviour of `display-buffer' is to always create a new
;; window. As I normally use a large display sporting a number of
;; side-by-side windows, this is a bit obnoxious.
;;
;; The code below will make Emacs reuse existing windows, with the
;; exception that if have a single window open in a large display, it
;; will be split horisontally.
(setq pop-up-windows nil)

(defun my-display-buffer-function (buf not-this-window)
  (if (and (not pop-up-frames)
           (one-window-p)
           (or not-this-window
               (not (eq (window-buffer (selected-window)) buf)))
           (> (frame-width) 162))
      (split-window-horizontally))
  ;; Note: Some modules sets `pop-up-windows' to t before calling
  ;; `display-buffer' -- Why, oh, why!
  (let ((display-buffer-function nil)
        (pop-up-windows nil))
    (display-buffer buf not-this-window)))

(setq display-buffer-function 'my-display-buffer-function)

(provide 't-looks)
