;;load real config file 
(setq custom-file (expand-file-name "config.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;ShowNumbers
;;(global-display-line-numbers-mode))
