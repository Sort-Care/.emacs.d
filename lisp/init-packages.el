;;  ;;;packages

;; (when (>= emacs-major-version 24)
;;   (package-initialize)
;;   (require 'package)
;;   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;   )
;; (require 'cl)

;; ;;add whatever packages you want here
;; (defvar hudsonjoe/packages '(
;; 			     ;;special file modes
;; 			     js2-mode
;; 			     bison-mode
;; 			     ;;swift-mode
;; 			     web-mode

			     
;; 			     ;;functionalities
;; 			     company
;; 			     swiper
;; 			     counsel
;; 			     popwin
;; 			     reveal-in-osx-finder
;; 			     org-pomodoro
;; 			     helm-ag
;; 			     yasnippet
;; 			     auto-yasnippet
;; 			     neotree
;; 			     exec-path-from-shell
;; 			     which-key
;; 			     auctex
;; 			     company-auctex
;; 			     chinese-fonts-setup
;; 			     ag
;; 			     helm
;; 				 helm-swoop
;; 				 helm-gtags
;; 			     ggtags
;; 				 irony
;; 				 company-irony
;; 				 cask
;; 				 pallet
			     
;; 			     ;;edit convenience
;; 			     hungry-delete
;; 			     smartparens
;; 			     expand-region
;; 			     iedit

			     
;; 			     ;;theme
;; 			     monokai-theme
;; 			     moe-theme	    

;; 	    ) "Default packages")

;; (setq package-selected-packages hudsonjoe/packages)

;; (defun hudsonjoe/packages-installed-p ()
;;   (loop for pkg in hudsonjoe/packages
;; 	when (not (package-installed-p pkg)) do (return nil)
;; 	finally (return t)))

;; (unless (hudsonjoe/packages-installed-p)
;;   (message "%s" "Refreshing package database...")
;;   (package-refresh-contents)
;;   (dolist (pkg hudsonjoe/packages)
;;     (when (not (package-installed-p pkg))
;;       (package-install pkg)))
;;   )



(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))




;;hungry delete 
(require 'hungry-delete)
(global-hungry-delete-mode)


;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)



;;popwin activation
(require 'popwin)
(popwin-mode t)


;; smartparens
(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)


;; configure js2-mode, html-mode for files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;;global company mode activation
(global-company-mode t)




(require 'org-pomodoro)


;;reveal-in-osx-finder
(require 'reveal-in-osx-finder)

(require 'expand-region)

;;swift mode
;;(require 'swift-mode)


;;flycheck
(global-flycheck-mode)


;;(require 'spaceline-config)
;;(spaceline-spacemacs-theme)

;; moe theme settings
(require 'moe-theme)
;;(setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
(setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
(setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))



;;yasnippet
(require 'yasnippet) 
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)


;;
(require 'neotree)

;;company-auctex
(require 'company-auctex)
(company-auctex-init)


;;chinese-fonts-setup
(require 'chinese-fonts-setup)

;;ag
(require 'ag)

;;
(which-key-mode 1)

;;undo tree
(global-undo-tree-mode)

;;irony
(require 'irony)
(require 'irony-cdb)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;;
(require 'company-irony)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))


;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)




;;load theme
;;(load-theme 'spacemacs-dark t)
;;(moe-light)
(moe-dark)

(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
;;; init-packages.el ends here
