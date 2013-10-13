(load-theme 'wombat t)

;; Hide splash-screen and startup-message
(setq inhibit-splash-screen -1)
(setq inhibit-startup-message -1)

(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))
;;Enable ido mode
(ido-mode t)
;;Gtags mode
(require 'ggtags)


;; PHP mode
(require 'php-mode)
;;Use $ as a word
(add-hook 'php-mode-hook
	  (lambda () 
	    (modify-syntax-entry ?\$ "_" php-mode-syntax-table)
	    (ggtags-mode t)
	    (subword-mode t)
	    (require 'php-electric)
	    ))

;; enable recent mode
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(defun disable-bars ()
  "Toggles bars visibility."
  (interactive)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(global-set-key [f11] 'toggle-bars)
(disable-bars)

;; w3m
(require 'w3m-load)
(setq w3m-use-cookies t)

;;Markdown
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
