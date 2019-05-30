;; Load the rest of the packages
(package-initialize t)
(setq package-enable-at-startup nil)

;; load literal configuration
(org-babel-load-file
 (expand-file-name "config.org"
                   user-emacs-directory))

;; load additional configuration
(cond ((is-yizhx) (org-babel-load-file
                   (expand-file-name "~/WorkDocs/amazon-config.org"))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-pass pass org-ref toc-org org-cliplink julia-repl which-key visual-regexp use-package smartparens selected rainbow-delimiters py-autopep8 pcmpl-git paradox origami org-super-agenda org-bullets nord-theme neotree magit linum-relative jedi interaction-log git-timemachine git-link git-auto-commit-mode flycheck f expand-region ess esh-autosuggest ensime emojify elpy elisp-slime-nav discover-my-major company-jedi beginend aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-done ((t (:strike-through t))))
 '(org-headline-done ((t (:strike-through t))))
 '(org-image-actual-width (quote (600)))
 '(variable-pitch ((t (:family "ETBembo")))))
