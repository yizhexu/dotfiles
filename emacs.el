(setq user-full-name "Yizhe Xu"
      user-mail-address "me@yizhexu.com")

;; initalize all ELPA packages
(require 'package)
(package-initialize)

(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(require 'pallet)
(pallet-mode t)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)
(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)

(setq debug-on-error t)
(setq debug-on-quit t)

;; Keep track of loading time

(require 'cl)

;; backups go to where backups all go
 (setq backup-directory-alist
       '(("." . "~/.emacs_backups")))

 ;; delete old backups
 (setq delete-old-versions t)

 ;; version control on auto save?
 (setq version-control t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(setq
 ;; update every 15 seconds instead of 60 seconds
 display-time-interval 15)
(display-time-mode 1)

(setq sentence-end-double-space nil)

(use-package smart-mode-line)

(use-package guide-key
  :defer t
  :diminish guide-key-mode
  :config
  (progn
  (setq guide-key/guide-key-sequence '("C-x r" "C-x 4" "C-c"))
  (guide-key-mode 1)))  ; Enable guide-key-mode

(defun my/unfill-paragraph (&optional region)
    "Takes a multi-line paragraph and makes it into a single line of text."
    (interactive (progn
                   (barf-if-buffer-read-only)
                   (list t)))
    (let ((fill-column (point-max)))
      (fill-paragraph nil region)))
(bind-key "M-Q" 'my/unfill-paragraph)

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

;; Mostly taken from
;; http://blog.binchen.org/posts/what-s-the-best-spell-check-set-up-in-emacs.html
(setq ispell-program-name "hunspell")
(setq ispell-local-dictionary "en_US")
(setq ispell-local-dictionary-alist
      ;; Please note the list `("-d" "en_US")` contains ACTUAL parameters
      ;; passed to hunspell You could use `("-d" "en_US,en_US-med")`
      ;; to check with multiple dictionaries
      '(("en_US" "[[:alpha:]]" "[^[:alpha:]]" "[']" nil ("-d" "en_US") nil utf-8)))
(setq ispell-extra-args
	(list "--sug-mode=fast" ;; ultra|fast|normal|bad-spellers
	      "--lang=en_US"
	      "--ignore=4"))
 ;; check spells in text documents
(dolist (hook '(text-mode-hook
		  org-mode-hook
		  markdown-mode-hook))
(add-hook hook (lambda () (flyspell-mode 1))))


(dolist (mode '(emacs-lisp-mode-hook))
		  ;;python-mode-hook))
    (add-hook mode
	      '(lambda ()
		 (flyspell-prog-mode))))

(line-number-mode 1)
(column-number-mode 1)

(delete-selection-mode 1)

(setq read-file-name-completion-ignore-case t)

(setq make-pointer-invisible t)

(setq-default fill-column 80)
(setq-default default-tab-width 2)
(setq-default indent-tabs-mode nil)

;; clean up the mode line
(setq minions-mode-line-lighter "☰")
(minions-mode 1)

;; maximize the text window?
(menu-bar-mode -1)
(tool-bar-mode -1)


;; set theme
(load-theme 'material t)

;; set font
(set-default-font "Hack-12")

;; max height at start
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . fullscreen)))))

;; syntax highlighting
(global-font-lock-mode t)

(setq split-height-threshold nil)
(setq split-width-threshold 180)

(setq whitespace-style '(tabs newline space-mark
                         tab-mark newline-mark
                         face lines-tail))

(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. e.g. (insert-char 182 1)
      ;; 32 SPACE, 183 MIDDLE DOT
      '((space-mark nil)
        ;; 10 LINE FEED
        ;;(newline-mark 10 [172 10])
        (newline-mark nil)
        ;; 9 TAB, MIDDLE DOT
        (tab-mark 9 [183 9] [92 9])))

;; turn on whitespace mode globally in prog-mode buffers
;; (add-hook 'prog-mode-hook #'whitespace-mode)
(add-hook 'whitespace-mode-hook (lambda () (diminish 'whitespace-mode)))

(setq-default show-trailing-whitespace t)

;; on OSX Emacs needs help setting up the system paths
(when (memq window-system '(mac ns))
  (require 'exec-path-from-shell)
  ;; From https://github.com/aculich/.emacs.d/blob/master/init.el
  ;; Import additional environment variables beyond just $PATH
  (dolist (var '("PYTHONPATH"         ; Python modules
                 "INFOPATH"           ; Info directories
                 "JAVA_OPTS"          ; Options for java processes
                 "SBT_OPTS"           ; Options for SBT
                 "RUST_SRC_PATH"      ; Rust sources, for racer
                 "CARGO_HOME"         ; Cargo home, for racer
                 "EMAIL"              ; My personal email
                 "GPG_TTY"
                 "GPG_AGENT_INFO"
                 "SSH_AUTH_SOCK"
                 "SSH_AGENT_PID"
                 ))
    (add-to-list 'exec-path-from-shell-variables var))
  (exec-path-from-shell-initialize))

;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-to-list 'auto-mode-alist '("\\.sh$" . shell-script-mode))

; enable elpy
(elpy-enable)

; where to look for environments
(setenv "WORKON_HOME" "/home/yizhe/.conda/envs")
(pyvenv-mode 1)

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

(global-set-key (kbd "C-x g") 'magit-status)
