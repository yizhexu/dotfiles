;; Load the rest of the packages
(package-initialize t)
(setq package-enable-at-startup nil)

;; load literal configuration
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))

;; load additional configuration
;; (cond ((is-yizhx) (org-babel-load-file (expand-file-name "additional-config.org" user-emacs-directory))))
(setq custom-file "~/.emacs.d/custom-set-variables.el")
