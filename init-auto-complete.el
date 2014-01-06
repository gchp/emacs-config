;;; This file is based on Steve Purcell's auto-completion config
;;; http://github.com/purcell/emacs.d/

(require-package 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-expand-on-auto-complete nil)
(setq-default ac-auto-start nil) ;; set to nil in order to play nice with yasnippets
(setq-default ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed

(setq tab-always-indent 'complete)  ;; use 't when auto-complete is disabled
(add-to-list 'completion-styles 'initials t)

(setq c-tab-always-indent nil
      c-insert-tab-function 'indent-for-tab-command)


;; hook AC into completion-at-point
(defun sanityinc/auto-complete-at-point ()
  (when (and (not (minibufferp))
             (fboundp 'auto-complete-mode)
             auto-complete-mode)
    (auto-complete)))

(defun sanityinc/never-indent ()
  (set (make-local-variable 'indent-line-function) (lambda () 'noindent)))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions
        (cons 'sanityinc/auto-complete-at-point
              (remove 'sanityinc/auto-complete-at-point completion-at-point-functions))))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)



(set-default 'ac-sources
             '(ac-source-imenu
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))



(dolist (mode '(magit-log-edit-mode
                log-edit-mode org-mode text-mode haml-mode
                git-commit-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode
                js2-mode js3-mode css-mode less-css-mode sql-mode
                sql-interactive-mode
                inferior-emacs-lisp-mode))
  (add-to-list 'ac-modes mode))


(provide 'init-auto-complete)
