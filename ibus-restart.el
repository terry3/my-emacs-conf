;;; ibus-restart.el --- restart ibus

;; Copyright 2012 Guo Teng-fei
;;
;; Author: guotf@Guotft
;; Version: $Id: ibus-restart.el,v 0.0 2012/11/22 06:10:07 guotf Exp $
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
;;  Restart ibus!
;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'ibus-restart)

;;; Code:

(defun terry-ibus-restart ()
  "restart ibus yet"
  (interactive)
  (shell-command "/home/guotf/sh/ibus-restart.sh"))

(global-set-key (kbd "<f12>") 'terry-ibus-restart)

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; none.

(provide 'ibud-restart)

;;; ibus-restart.el ends here
