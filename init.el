;;hacking
;;author hudson joe

;;==========================================================
;;Personal configuration
;;===========================================================
;;============================================
;; add path block

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t) 

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/elpa/moe-theme")
(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/moe-theme")

;;============================================
;;============================================
;; require block

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)
;;recent file
(require 'init-cindent)
(require 'recentf)
(require 'setup-helm)
(require 'setup-helm-gtags)
;;(require 'setup-ggtags)
(require 'sr-speedbar)
;;============================================


;;load-file and load


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)
