;; Load the rest of the packages
(package-initialize t)
(setq package-enable-at-startup nil)

;; load literal configuration
(org-babel-load-file
 (expand-file-name "config.org"
                   user-emacs-directory))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(debug-on-error t)
 '(package-selected-packages
   (quote
    (aggressive-indent emojify beginend selected interaction-log discover-my-major help-fns help-fns+ which-key company-jedi jedi elpy py-autopep8 pyvenv esh-autosuggest company-eshell-autosuggest neotree org-bullets nord-theme use-package paradox org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
