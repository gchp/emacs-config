(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq user-lib-dir (expand-file-name "lib" user-emacs-directory))
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path user-lib-dir)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(dolist (project (directory-files user-lib-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; load package config
(require 'setup-package)

;; list of packages
(defun init--install-packages ()
  (packages-install
   '(yasnippet
     elpy
     emmet-mode
     git-gutter
     zenburn-theme
     icomplete+
     magit
     js2-refactor
     less-css-mode
     flx-ido
     projectile)))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))


;; sane defaults from https://github.com/magnars/.emacs.d/
(require 'sane-defaults)

;; load zenburn theme
(load-theme 'zenburn t)

;; set font
(set-default-font "Source Code Pro-9")
(setq default-frame-alist '((font . "Source Code Pro-9")))

;; load local settings
(require 'local)

;; Highlight current line
;; (global-hl-line-mode t)

;;(elpy-enable)

(defun toggle-comment-on-line ()
  "comment or un-comment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

;; Indentation
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; Projectile
(require 'projectile)
(projectile-global-mode)

;; org-mode
(setq org-log-done 'note)

;; orj-jira
(require 'org-jira)
;; set jira url:
;; (setq jiralib-url "http://igajira:8080")


;; multiple cursors
(require 'multiple-cursors)

;; emacs powerline
(require 'powerline)
(setq powerline-color1 "gray30")
(setq powerline-color2 "gray45")

;; snippets
;;(require 'yasnippet)
;;(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
;;(yas-global-mode 1)

;; emmet config
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))
(setq emmet-move-cursor-between-quotes t)

;; icomplete
(icomplete-mode 1)
(setq icomplete-compute-delay 0)
(require 'icomplete+)

;; ido
(require 'ido)
(ido-mode t)

;; Expand region
(require 'expand-region)

;; Pony-mode
(add-to-list 'load-path (expand-file-name "pony-mode/src" user-lib-dir))
(require 'pony-mode)

;; Git gutter
(require 'git-gutter)
(global-git-gutter-mode t)

;; Set up magit to work with git-svn repos
(add-hook 'magit-mode-hook 'magit-load-config-extensions)
(defun magit-commit-mode-init ()
  (when (looking-at "\n")
    (open-line 1)))
(add-hook 'git-commit-mode-hook 'magit-commit-mode-init)

;; auto completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lib/auto-complete//ac-dict")
(ac-config-default)

;; rainbow mode
(require 'rainbow-mode)

(add-hook 'less-css-mode-hook (lambda () (rainbow-mode)))
(add-hook 'css-mode-hook (lambda () (rainbow-mode)))

;; js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(setq js2-global-externs '("module" "require" "define" "$"))

;; js2-refactor
(require 'js2-refactor)
(js2r-add-keybindings-with-prefix "C-c C-m")

(column-number-mode t)
(show-paren-mode t)
(global-visual-line-mode t)
(mouse-avoidance-mode 'banish)
(electric-pair-mode 1)
;;;;;;;;;;
;; Buffer defuns
;;;;;;;;;;;

;; change surrounding quotes
(defun surround-change-surrounding (quote replacement)
  (search-forward-regexp quote)
  (delete-char -1)
  (insert replacement)
  (search-backward-regexp quote)
  (delete-char 1)
  (insert replacement)
  )

(defun surround-change-double-quote ()
  (interactive)
  (save-excursion
    (surround-change-surrounding "\"" "'")))

(defun surround-change-single-quote ()
  (interactive)
  (save-excursion
    (surround-change-surrounding "'" "\"")))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))


;; load custom keys
(require 'key-bindings)
