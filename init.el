;;install straight.el which is a package manager that does stuff
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;install evil
(straight-use-package 'evil)

(require 'evil)
(evil-mode 1)

;;Hide the top thingy
;;(setq default-frame-alist '((undecorated . t)))

(tool-bar-mode -1)

;;Enables recent files beause I like that idea a lot
(require 'recentf)
(recentf-mode 1)
;;(setq recentf-max-menu-items (25))
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;install doom themes
(straight-use-package 'doom-themes)
(setq doom-themes-enable-bold t
    doom-themes-enable-italic t)
(load-theme 'doom-one t)

;;Add the numbers on the side
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;;Remofe the annoying files because I dont like them
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
`((".*" ,temporary-file-directory t)))

;;Remove the start buffer things cause me no like
;;Lol idk how to do that

;;Install autocompletion
;;Im gonna use corfu because I can but the other things I have considered and they might be faster are auto-complete and company-mode
(straight-use-package 'corfu)
;;(corfu-auto t)
(global-corfu-mode)
(setq corfu-auto t
      corfu-quit-no-match 'seperator)
