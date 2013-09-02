;; Bind C-@ to expand region
(global-set-key (kbd "C-@") 'er/expand-region)

;; Bind C-c C-s cs ("|') to toggle surrounding quotes
(global-set-key (kbd "C-c C-s cs \"") 'surround-change-double-quote)
(global-set-key (kbd "C-c C-s cs '") 'surround-change-single-quote)

;; Magit
(global-set-key (kbd "C-c C-m s") 'magit-status)
(autoload 'magit-status "magit")
(global-set-key (kbd "C-c C-m p") 'magit-push)
(autoload 'magit-push "magit")
(global-set-key (kbd "C-c C-m dc") 'magit-svn-dcommit)
(autoload 'magit-svn-dcommit "magit")
(global-set-key (kbd "C-c C-m sr") 'magit-svn-rebase)

(provide 'key-bindings)
