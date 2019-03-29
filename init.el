;; Load the rest of the packages
(package-initialize t)
(setq package-enable-at-startup nil)

;; load literal configuration
(org-babel-load-file
 (expand-file-name "config.org"
                   user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(debug-on-error t)
 '(package-selected-packages
   (quote
    (origami org-super-agenda flycheck-clojure aggressive-indent emojify beginend selected interaction-log discover-my-major help-fns help-fns+ which-key company-jedi jedi elpy py-autopep8 pyvenv esh-autosuggest company-eshell-autosuggest neotree org-bullets nord-theme use-package paradox org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-done ((t (:background "#E8E8E8" :foreground "#0E0E0E" :strike-through t :weight bold))))
 '(org-headline-done ((t (:foreground "#171717" :strike-through t))))
 '(org-image-actual-width (quote (600)))
 '(variable-pitch ((t (:family "ETBembo")))))
