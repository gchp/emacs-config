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
;; (require 'init-evil)

(require 'init-flycheck)

(require-package 'yasnippet)
(require-package 'elpy)
(require-package 'emmet-mode)
(require-package 'icomplete+)
(require-package 'less-css-mode)
(require-package 'flx-ido)
(require-package 'projectile)
(require-package 'smartparens)
(require-package 'markdown-mode)
(require-package 'web-mode)

(require 'init-git)

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

(elpy-enable)
(add-hook 'elpy-mode-hook '(lambda ()
                             (highlight-indentation-mode -1)
                             (elpy-use-ipython)))



;; Projectile
(require 'projectile)
(projectile-global-mode)

;; org-mode
(require 'init-org)

;; multiple cursors
(require 'multiple-cursors)

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

;; auto completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lib/auto-complete//ac-dict")
(ac-config-default)

;; rainbow mode
(require 'rainbow-mode)

(add-hook 'less-css-mode-hook (lambda () (rainbow-mode)))
(add-hook 'css-mode-hook (lambda () (rainbow-mode)))

(require 'init-javascript)

(require 'init-buffers)

;; load custom keys
(require 'init-key-bindings)


(provide 'init)
;;; init.el ends here
