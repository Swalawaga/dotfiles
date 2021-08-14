;;Hello this is my really shitty emacs config Yeah
;;Packages and stuff
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;(ac-config-default)
;;(define-key ac-completing-map "\e" 'ac-stop)


;;Add a better org mode
(require 'package)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
;;load the languages you want to use for org mode dont add everything
(org-babel-do-load-languages 'org-babel-load-languages
			     '(
			       (shell . t)
			       )
			     )
;;Theme example probably wont use but just in case
;;(use-package dracula-theme 
;;  :ensure t
;;  :config (load-theme dracula-theme t))

;;Test loading a theme
;;elpa/dracula-theme-1.7.0/dracula-theme.el
;;(load-file "~/.emacs.d/elpa/dracula-theme-1.7.0/dracula-theme.el")
;;Pywal colors
(add-hook
 'before-make-frame-hook
 (lambda ()
   (when (file-readable-p "~/.cache/wal/colors.el")
    (load-file "~/.cache/wal/colors.el")
    (set-face-attribute 'what-ever-face nil :background wal-foreground :foreground "black"))))

;;Opacity
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;;Old way of setting colors pointless now because I use wal colors
;;(add-to-list 'default-frame-alist '(foreground-color . "#bfb26b2"))
;;(add-to-list 'default-frame-alist '(background-color . "#0B1E1E"))
(setq-default cursor-type 'bar)
(set-cursor-color "#bfb9b2")

;;Removing stuff I dont like
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;Enable org mode
(setq inhibit-splash-screen t)
(transient-mark-mode 1)
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;;Show where to backup the files
;;This stores it in a emacs directory called backups
;;(setq backup-directory-alist
;;      `(("." . ,(concat user-emacs-directory "backups"))))
;;This stores it in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;;Show Numbers I personally dont like it but just incase you can also enable it with M-x
;;(global-display-line-numbers-mode)

;;Keep a list of recently opened files
(require 'recentf)
(recentf-mode 1)

;;(ido-mode)
;;(setq ido-enable-flex-matching t)

;;Find things you should use are (ido-mode) which replaces default C-x C-f and this is only optional but you can also use (setq ido-enable-flex-matching t)
;;The other find is M-x find-name-dired
;;This is some annoying as shit that I think I need but I am not sure
(setq font-lock-maximum-decoration t)

(setq frame-background-mode 'dark)

(setq auto-mode-alist '(("\\.ad[bs]\\'"   . ada-mode)
                        ("\\.awk\\'"      . awk-mode)
                        ("\\.lex\\'"      . c-mode)
                        ("\\.[cy]\\'"     . c++-mode)
                        ("\\.h\\'"        . c++-mode)
                        ("\\.hxx\\'"      . c++-mode)
                        ("\\.[CH]\\'"     . c++-mode)
                        ("\\.java\\'"     . java-mode)
                        ("\\.cc\\'"       . c++-mode)
                        ("\\.hh\\'"       . c++-mode)
                        ("\\.cxx\\'"      . c++-mode)
                        ("\\.cpp\\'"      . c++-mode)
                        ("\\.rc\\'"       . c++-mode) ;; resource files
                        ("\\.rcv\\'"      . c++-mode)
                        ("\\.m\\'"        . matlab-mode)
                        ("\\.p[lm]\\'"    . perl-mode)
                        ("\\.cgi\\'"      . perl-mode)
                        ("\\.f\\'"      . fortran-mode)
                        ("\\.F\\'"      . fortran-mode)
                        ("\\.f90\\'"      . f90-mode)
                        ("\\.F90\\'"      . f90-mode)
                        ("\\.el\\'"       . emacs-lisp-mode)
                        ("\\.emacs\\'"    . emacs-lisp-mode)
                        ("\\.tex\\'"      . LaTeX-mode)
                        ("\\.bib\\'"      . bibtex-mode)
                        ("[Mm]akefile\\'" . makefile-mode)
                        ("\\.mak\\'"      . makefile-mode)
                        ("\\[Mm]akefile.\\'" . makefile-mode)
                        ("\\.bat\\'"      . shell-script-mode)
                        ("\\.tar\\'"      . tar-mode)
                        ("\\.php\\'"     . php-mode)
                        ("\\.html\\'"     . html-mode)
                        ("\\.jnlp\\'"     . html-mode)
                        ("\\.xml\\'"     . html-mode)
                        ("\\.pddl\\'"     . lisp-mode)
                        ("\\.css\\'"      . css-mode)
                        ("\\.py\\'"       . python-mode)
                        ("\\.yml\\'"      . yaml-mode)
			
                        ("\\.lisp\\'"     . lisp-mode)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(auto-complete use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
