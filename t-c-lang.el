(require 'xcscope)
(add-hook 'c-mode-common-hook
	  '(lambda ()
	    (require 'xcscope)))
(provide 't-c-lang)
