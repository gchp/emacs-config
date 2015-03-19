;;; Emacs-Config -- My Emacs configuration for day-to-day development work

;;; Commentary:

;; Initialisation file for my Emacs configuration

;;; Code:

(defvar user-lib-dir (expand-file-name "lib" user-emacs-directory))
(setq lisp-dir (expand-file-name "lisp" user-emacs-directory))

(add-to-list 'load-path lisp-dir)
(add-to-list 'load-path user-lib-dir)

(setq custom-file (expand-file-name "custom.el" lisp-dir))
(load custom-file)

(dolist (project (directory-files user-lib-dir t "\\w+"))
  (when (file-directory-p project)
    (add-to-list 'load-path project)))


(require 'init-utils)
(require 'init-package)
(require 'init-auto-complete)
;; (require 'init-helm)
(require 'init-gui)
(require 'init-flycheck)
(require 'init-git)
;; (require 'init-org)
(require 'init-javascript)
(require 'init-buffers)
(require 'init-snippets)
(require 'init-css)
(require 'init-python)
(require 'init-rust)
;; (require 'init-evil)

(require-package 'emmet-mode)
(require-package 'projectile)
(require-package 'markdown-mode)
(require-package 'web-mode)
(require-package 'rust-mode)

;; Initialize web-mode for .html files
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; sane defaults from https://github.com/magnars/.emacs.d/
(require 'sane-defaults)

;; Projectile
(require 'projectile)
(projectile-global-mode)

;; multiple cursors
(require-package 'multiple-cursors)
(require 'multiple-cursors)

;; emmet config
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))
(setq emmet-move-cursor-between-quotes t)

;; Expand region
(require 'expand-region)

;; load custom keys
(require 'init-key-bindings)


(provide 'init)
;;; init.el ends here
