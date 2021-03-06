;;
;; Better defaults
;;


;; forbid the ring bell
(setq ring-bell-function 'ignore)


;;==========================
;;set line number
;;==========================
(global-linum-mode 'linum-mode)


;; turn on auto revert 
(global-auto-revert-mode 1)



;;defin abbreviations
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;;signature
					    ("hj" "hudsonjoe")
					    ;;
					    ))


;;不产生备份文件  
(setq make-backup-files nil)
(setq auto-save-default nil)


;; recent files
(recentf-mode 1)
(setq recentf-max-menu-items 30)

(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     ad-do-it)))
  )


;;hight matching parenthesis
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


;;replace selected text with new input
(delete-selection-mode t)


;;缩进
(defun indent-buffer ()
  "Indent the current visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer"
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region.")
	  )
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

;; hippie expand settings
(setq hippie-expand-try-functions-list '(
					 try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol))



;;===============================================
;;Dired mode settings
;;===============================================

;; set recursive deletes and copies
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; set only one buffer for dired mode
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;;(require 'dired)
;;(defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;;延迟Dired load
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


;; this setting allows you to use keybindings: C-x C-j to enter the path of current file folder
(require 'dired-x)

;; this setting allows you to copy the contents to the other window when more than two
;; windows are available in a frame.
(setq dired-dwin-target t)

;; using y / n instead of yes / no
(fset 'yes-or-no-p 'y-or-n-p)

;; recursive delete and copy
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)


;;
(put 'dired-find-alternate-file 'disabled nil)

;; set encoding
(set-language-environment "UTF-8")

;; URL
(defun hudsonjoe/insert-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (insert (hudsonjoe/retrieve-chrome-current-tab-url))
  )
(defun hudsonjoe/retrieve-chrome-current-tab-url()
  "Get the URL of the active tab of the first window"
  (interactive)
  (let ((result (do-applescript
		 (concat
		  "set frontmostApplication to path to frontmost application\n"
		  "tell application \"Google Chrome\"\n"
		  " set theUrl to get URL of active tab of first window\n"
		  " set theResult to (get theUrl) \n"
		  "end tell\n"
		  "activate application (frontmostApplication as text)\n"
		  "set links to {}\n"
		  "copy theResult to the end of links\n"
		  "return links as string\n"))))
    (format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))


;; move line or region
(require 'move-lines)
(move-lines-binding)


;;speedbar
(setq speedbar-show-unknown-files t)

;;encoding
(set-language-environment "UTF-8")


(provide 'init-better-defaults)
;;; init-better-defaults.el ends here
