;; package repos
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(defvar my-packages '(zenburn-theme
		      icomplete+
		      magit))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; load zenburn theme
(load-theme 'zenburn t)

;; hide menu bar and toolbar
(menu-bar-mode -1)
(tool-bar-mode -1)


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

;key bindings
(global-set-key (kbd "C-c C-s cs \"") 'surround-change-double-quote)
(global-set-key (kbd "C-c C-s cs '") 'surround-change-single-quote)
