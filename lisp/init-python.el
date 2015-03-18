(require-package 'elpy)

;; use elpy mode
(elpy-enable)

(add-hook 'elpy-mode-hook '(lambda ()
                             ;; hide indentation guides
                             (highlight-indentation-mode -1)
                             ;; use ipython interpreter
                             (elpy-use-ipython)))

(provide 'init-python)
