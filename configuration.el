(setq inhibit-startup-screen t)

(defun sensible-defaults/reset-text-size ()
  (interactive)
  (text-scale-set 0))

"Allow 20MB of memory (instead of 0.76MB) before calling
garbage collection. This means GC runs less often, which speeds
up some operations."
  (setq gc-cons-threshold 20000000)

(setq visible-bell t)

(let ((backup-dir "~/Documents/backups")
      (auto-saves-dir "~/Documents/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too

"Call DELETE-TRAILING-WHITESPACE every time a buffer is saved."
(add-hook 'before-save-hook 'delete-trailing-whitespace)

"Don't assume that sentences should have two spaces after
periods. This ain't a typewriter."

(setq require-final-newline t)

"When saving a file that starts with `#!', make it executable."
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

(global-auto-revert-mode t)

"When saving a file in a directory that doesn't exist, offer
to (recursively) create the file's parent directories."
  (add-hook 'before-save-hook
            (lambda ()
              (when buffer-file-name
                (let ((dir (file-name-directory buffer-file-name)))
                  (when (and (not (file-exists-p dir))
                             (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                    (make-directory dir t))))))

(setq-default dired-listing-switches "-alh")

(global-font-lock-mode t)

(show-paren-mode t)
(setq show-paren-delay 0.0)

(setq-default fill-column 80)

"If some text is selected, and you type some text, delete the
selected text and start inserting your typed text."
(delete-selection-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)

(define-key global-map (kbd "C-)") 'sensible-defaults/reset-text-size)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C-_") 'text-scale-decrease)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(setq user-full-name "Yizhe Xu"
      user-mail-address "me@yizhexu.com"
      calendar-latitude 39.7
      calendar-longitude -104.9)

(defun yizhe/append-to-path (path)
  "Add a path both to the $PATH variable and Emacs's path"
  (setenv "PATH" (concat (getenv "PATH") ":" path))
  (add-to-list 'exec-path path))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(horizontal-scroll-bar-mode -1)

;; also this mini scroll bar
(set-window-scroll-bars (minibuffer-window) nil nil)

(setq frame-title-format '((:eval (projectile-project-name))))

(use-package neotree
	:bind ([f8] . neotree-toggle))

(defun transparency (alpha)
  "set transparency of the frame window. 0=transparent/ 100=opaque"
  (interactive "Transparency Value 0-100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha alpha))

(defun apply-theme()
  "use the theme and make frame a bit transparent"
  (interactive)
  (load-theme 'material t)
  (transparency 90))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame (apply-theme))))
  (apply-theme))

(set-default-font "Hack-12")

(global-prettify-symbols-mode t)

(setq scroll-conservatively 100)

(setq-default tab-width 2)

(global-subword-mode 1)

(setq compilaton-scroll-output t)

(setenv "GOPATH" "/home/yizhe/Go")
(yizhe/append-to-path (concat (getenv "GOPATH") "/bin"))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 '(company-go))
            (company-mode)
            (if (not (string-match "go" compile-command))
                (set (make-local-variable 'compile-command)
                     "go build -v && go test -v && go vet"))
            (flycheck-mode)))

(setq lispy-mode-hooks
      '(emacs-lisp-mode-hook
        lisp-mode-hook))

(dolist (hook lispy-mode-hooks)
  (add-hook hook (lambda ()
                   (setq show-paren-style 'expression)
                   (paredit-mode)
                   (rainbow-delimiters-mode))))

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

(use-package magit
  :bind ("C-x g" . magit-status)

  :config
  (use-package evil-magit)
  (setq git-commit-summary-max-length 50)
  (add-hook 'git-commit-mode-hook 'turn-on-flyspell))

(require 'diff-hl)

(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)

(yizhe/append-to-path "/opt/anaconda/bin")

; where to look for environments
(setenv "WORKON_HOME" "/home/yizhe/.conda/envs")
(pyvenv-mode 1)

;; enable elpy
(elpy-enable)

;; ipython interpreter

  (setq python-shell-interpreter "jupyter"
        python-shell-interpreter-args "console --simple-prompt"
        python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters
               "jupyter")

;; syntax check on the fly
(when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(add-to-list 'company-backends 'company-jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(add-hook 'sh-mode-hook
          (lambda ()
            (setq sh-basic-offset 2
                  sh-indentation 2)))

(global-set-key (kbd "C-c t") 'multi-term)

(setq multi-term-program-switches "--login")

(add-hook 'term-mode-hook
          (lambda ()
            (goto-address-mode)))

(use-package scala-mode
  :interpreter
  ("scala" . scala-mode))
(use-package sbt-mode)

(setq ensime-startup-notification nil)

(use-package org-bullets
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

(setq org-ellipsis "⤵")

(setq org-src-fontify-natively t)

(setq org-src-tab-acts-natively t)

(setq org-src-window-setup 'current-window)

(add-to-list 'org-structure-template-alist
             '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(add-hook 'org-mode-hook 'flyspell-mode)
