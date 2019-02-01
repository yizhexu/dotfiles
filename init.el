
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
<<<<<<< HEAD
 '(org-modules
	 (quote
		(org-bbdb org-bibtex org-docview org-eww org-gnus org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-selected-packages
	 (quote
		(toc-org anki-editor smartparens color-identifiers-mode material use-package tramp-term smart-mode-line rainbow-delimiters py-autopep8 paredit pallet org-bullets nord-theme neotree multiple-cursors multi-term minions material-theme julia-repl jedi htmlize guide-key go-mode go-autocomplete flycheck evil-magit ess ensime elpy diff-hl company-jedi auto-compile))))
=======
 '(package-selected-packages
	 (quote
		(anki-editor smartparens color-identifiers-mode material use-package tramp-term smart-mode-line rainbow-delimiters py-autopep8 paredit pallet org-bullets nord-theme neotree multiple-cursors multi-term minions material-theme julia-repl jedi htmlize guide-key go-mode go-autocomplete flycheck evil-magit ess ensime elpy diff-hl company-jedi auto-compile))))
>>>>>>> 2cbb22f188527f6f97520925a5700757c7edcc9f
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
