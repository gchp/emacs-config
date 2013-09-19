;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; Bind C-c C-s cs ("|') to toggle surrounding quotes
(global-set-key (kbd "C-c C-s cs \"") 'surround-change-double-quote)
(global-set-key (kbd "C-c C-s cs '") 'surround-change-single-quote)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status)

;; Multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Pony mode
(global-set-key (kbd "C-c pm") 'pony-tpl-mode)

;; Commenting
(global-set-key (kbd "C-x /") 'toggle-comment-on-line)

;; Buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c n") 'cleanup-buffer)
(provide 'key-bindings)
