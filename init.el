
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
 '(package-selected-packages
	 (quote
		(cherry-blossom-theme use-package tramp-term toc-org smartparens smart-mode-line rainbow-delimiters py-autopep8 paredit pallet org-ref org-plus-contrib org-bullets org nord-theme neotree multiple-cursors multi-term material-theme julia-repl jedi guide-key go-eldoc go-autocomplete flycheck evil-magit ess ensime elpy diff-hl company-jedi company-go color-identifiers-mode auto-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
