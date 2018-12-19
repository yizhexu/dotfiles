;; initialize package.el packages
(package-initialize)

;; Use cask & pallet to manage packages
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

;; load literal configuration
(org-babel-load-file
 (expand-file-name "configuration.org"
                   user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . fullheight))))
 '(org-agenda-files (quote ("~/Documents/org/index.org")))
 '(package-selected-packages
	 (quote
<<<<<<< HEAD
		(htmlize org-bullets diff-hl multi-term ensime scala-mode jedi py-autopep8 evil-magit rainbow-delimiters paredit nord-theme go-eldoc auto-complete-config go-autocomplete auto-complete go-mode ess guide-key auto-compile use-package smart-mode-line multiple-cursors elpy minions pallet))))
=======
		(tramp-term neotree org-bullets diff-hl multi-term ensime scala-mode jedi py-autopep8 evil-magit rainbow-delimiters paredit nord-theme go-eldoc auto-complete-config go-autocomplete auto-complete go-mode ess guide-key auto-compile use-package smart-mode-line multiple-cursors elpy minions pallet))))
>>>>>>> de4611aa3fad7f7a8b450458ec66f3b197925deb
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
