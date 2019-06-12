;; Load the rest of the packages
(package-initialize t)
(setq package-enable-at-startup nil)

;; load literal configuration
(org-babel-load-file
 (expand-file-name "config.org"
									 user-emacs-directory))

;; load additional configuration
(cond ((is-yizhx) (org-babel-load-file
									 (expand-file-name "secret.org"
																		 user-emacs-directory))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	 (quote
		(pcmpl-git git-link git-timemachine aggressive-indent linum-relative emojify selected expand-region origami org-super-agenda org-noter org-ref toc-org org-cliplink org-bullets graphviz-dot-mode sql-indent git-auto-commit-mode magit elisp-slime-nav visual-regexp julia-repl company-jedi jedi py-autopep8 color-identifiers-mode elpy pyvenv ess ensime scala-mode sbt-mode esh-autosuggest company interaction-log discover-my-major which-key pass rainbow-delimiters f smartparens neotree nord-theme paradox use-package)))
 '(pdf-tools-handle-upgrades nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-done ((t (:strike-through t))))
 '(org-headline-done ((t (:strike-through t))))
 '(org-image-actual-width (quote (600)))
 '(variable-pitch ((t (:family "ETBembo")))))
