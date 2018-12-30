
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
