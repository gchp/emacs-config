;; Bind C-@ to expand region
(global-set-key (kbd "C-@") 'er/expand-region)

;; Bind C-c C-s cs ("|') to toggle surrounding quotes
(global-set-key (kbd "C-c C-s cs \"") 'surround-change-double-quote)
(global-set-key (kbd "C-c C-s cs '") 'surround-change-single-quote)

;; Magit
(global-set-key (kbd "C-c ms") 'magit-status)
(global-set-key (kbd "C-c mp") 'magit-push)
(global-set-key (kbd "C-c mdc") 'magit-svn-dcommit)
(global-set-key (kbd "C-c msr") 'magit-svn-rebase)

(provide 'key-bindings)
