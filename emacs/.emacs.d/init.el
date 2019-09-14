;; Load the rest of the packages
(package-initialize t)
(setq package-enable-at-startup nil)

;; load literal configuration
(if (string-equal user-login-name "u0_a229")
  (org-babel-load-file (expand-file-name "config-mobile.org" user-emacs-directory))
  (org-babel-load-file (expand-file-name "config.org" user-emacs-directory)))

;; load additional configuration
;; (cond ((is-yizhx) (org-babel-load-file (expand-file-name "additional-config.org" user-emacs-directory))))
(setq custom-file "~/.emacs.d/custom-set-variables.el")
