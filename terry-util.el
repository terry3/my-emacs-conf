;;; terry-util.el --- 

;; Copyright 2013 Guotf
;;
;; Author: guotf@tf-laptop
;; Version: $Id: vim-find.el,v 0.0 2013/03/26 12:31:21 guotf Exp $
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'terry-util)

;;; Code:

(provide 'terry-util)
(eval-when-compile
  (require 'cl))

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

(defun terry-get-point-string (point)
  "get point char, then convert it to string"
  (message (int-to-string point))
  (char-to-string (char-after point)))

;;(terry-get-point-string 3)

(defun terry-vim-find (char)
  "vim like find. In vim type 'f' then type a char then find the char in thie line."
  (interactive "k")
  (if (string= (terry-get-point-string (point)) char)
	  (search-forward char nil t 2)
	(search-forward char nil t 1))
  (goto-char (1- (point))))

(global-set-key (kbd "M-w") 'terry-copy)
(global-set-key (kbd "C-w") 'terry-kill)

(global-set-key (kbd "M-i") 'terry-insert-next-line)
(global-set-key (kbd "M-u") 'terry-insert-prev-line)

(global-set-key (kbd "C-3") 'terry-vim-find)

;;; terry-util.el ends here
