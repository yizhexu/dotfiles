;; Load the rest of the packages
(package-initialize t)
(setq package-enable-at-startup nil)

;; Straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; load literal configuration
(if (string-equal system-name "localhost")
    (org-babel-load-file (expand-file-name "config-mobile.org" user-emacs-directory))
  (org-babel-load-file (expand-file-name "config.org" user-emacs-directory)))

;; load additional configuration
;; (cond ((is-yizhx) (org-babel-load-file (expand-file-name "additional-config.org" user-emacs-directory))))
(setq custom-file "~/.emacs.d/custom-set-variables.el")
