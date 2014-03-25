(load-theme 'wombat t)
;; No backup files
(setq make-backup-files nil)
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
(load-theme 'wombat t)
;; No backup files
(setq make-backup-files nil)
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
(setq recentf-max-menu-items   )
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)


(subword-mode t)
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

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

;;puppet module
(autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests")
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(require 'slim-mode)
(add-to-list 'auto-mode-alist '("\\.js.emblem$" . slim-mode))
(add-to-list 'auto-mode-alist '("\\.emblem$" . slim-mode))

(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))

(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

(require 'erc)
(setq erc-autojoin-channels-alist
          '(("freenode.net" "#emacs" "#hapi" "#emberjs", "#boomgt ", "#stgt-chat")))
(setq erc-echo-notices-in-minibuffer-flag t)
(erc :server "irc.freenode.net" :port 6667 :nick "edwinallenz")

;;auto pair
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all 

;Kill buffer withourmessage prompt
(defun kill-this-buffer () 
  (interactive) 
  (kill-buffer (current-buffer)))

(global-set-key [f1] 'eshell)
;; Clears out annoying erc-track-mode stuff for when we don't care.
;; Useful for when ChanServ restarts :P
(defun reset-erc-track-mode ()
  (interactive)
  (setq erc-modified-channels-alist nil)
  (erc-modified-channels-update))
(global-set-key (kbd "C-c r") 'reset-erc-track-mode)

;;Resize window keys
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
