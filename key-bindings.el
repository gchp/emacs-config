;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; Bind C-c C-s cs ("|') to toggle surrounding quotes
(global-set-key (kbd "C-c C-s cs \"") 'surround-change-double-quote)
(global-set-key (kbd "C-c C-s cs '") 'surround-change-single-quote)

;; Magit
(global-set-key (kbd "C-c ms") 'magit-status)
(global-set-key (kbd "C-c mp") 'magit-push)
(global-set-key (kbd "C-c mdc") 'magit-svn-dcommit)
(global-set-key (kbd "C-c mr") 'magit-svn-rebase)

;; Multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


(provide 'key-bindings)
