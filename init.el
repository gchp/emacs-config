;;; Emacs-Config -- My Emacs configuration for day-to-day development work

;;; Commentary: 

;; Initialisation file for my Emacs configuration

;;; Code:

(defvar user-lib-dir (expand-file-name "lib" user-emacs-directory))
(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path user-lib-dir)

(require 'init-utils)
;; load package config
(require 'setup-package)


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

(dolist (project (directory-files user-lib-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))

;; Load GUI config
;; Contains theme, font, modeline, window config etc
(require 'init-gui)

;; Load Evil mode config
(require 'init-evil)

(require 'init-flycheck)

(require-package 'yasnippet)
(require-package 'elpy)
(require-package 'emmet-mode)
(require-package 'git-gutter)
(require-package 'icomplete+)
(require-package 'magit)
(require-package 'less-css-mode)
(require-package 'flx-ido)
(require-package 'projectile)
(require-package 'smartparens)
(require-package 'markdown-mode)
(require-package 'web-mode)

(require 'smartparens-config)
(require 'smartparens-html)
(smartparens-global-mode t)
(show-smartparens-global-mode t)
(sp-with-modes '((web-mode)
                 (html-mode))
  (sp-local-pair "%" "%"))


;; Initialize web-mode for .html files
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; sane defaults from https://github.com/magnars/.emacs.d/
(require 'sane-defaults)

;; Highlight current line
;; (global-hl-line-mode t)

;(elpy-enable)

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the active region, or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun toggle-comment-on-line ()
  "Comment or un-comment current line."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

;; Projectile
(require 'projectile)
(projectile-global-mode)

;; org-mode
(setq org-log-done 'note)

;; multiple cursors
(require 'multiple-cursors)

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
;; Add extra new line to magit commit messages
;; (defun magit-commit-mode-init ()
;;   (when (looking-at "\n")
;;     (open-line 1)))
;; (add-hook 'git-commit-mode-hook 'magit-commit-mode-init)

;; auto completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lib/auto-complete//ac-dict")
(ac-config-default)

;; rainbow mode
(require 'rainbow-mode)

(add-hook 'less-css-mode-hook (lambda () (rainbow-mode)))
(add-hook 'css-mode-hook (lambda () (rainbow-mode)))

(require 'init-javascript)

;;;;;;;;;;
;; Buffer defuns
;;;;;;;;;;;

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
(require 'init-key-bindings)


(provide 'init)
;;; init.el ends here
