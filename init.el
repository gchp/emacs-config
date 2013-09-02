;; package repos
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(setq user-lib-dir (expand-file-name "lib" user-emacs-directory))
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path user-lib-dir)
(dolist (project (directory-files user-lib-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))


;; load zenburn theme
(load-theme 'zenburn t)

;; set font
(set-default-font "Source Code Pro")

;; hide menu bar and toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; emacs powerline
(require 'powerline)
(setq powerline-color1 "gray30")
(setq powerline-color2 "gray45")

;; Turn on uniquify!
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")
(setq uniquify-separator " @ ")

;; icomplete 
(icomplete-mode 1)
(setq icomplete-compute-delay 0)
(require 'icomplete+)

;; ido
(require 'ido)
(ido-mode t)

;; Expand region
(require 'expand-region)


;; auto completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lib/auto-complete//ac-dict")
(ac-config-default)

(column-number-mode t)
(show-paren-mode t)
(global-visual-line-mode t)
(mouse-avoidance-mode 'banish)

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

;; load custom keys
(require 'key-bindings)

;; load emacs Custom-settings
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
