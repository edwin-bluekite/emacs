(let ((default-directory "/opt/emacs/.emacs.d/"))
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
	    ))
(require 'php-electric)

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
