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
	 (quote )))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
