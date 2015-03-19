(require-package 'key-chord)

;; Enable key-chord for keybindings
(key-chord-mode 1)

; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; Magit
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m l") 'magit-log)
(global-set-key (kbd "C-c m b") 'magit-blame-mode)
(global-set-key (kbd "C-c m m") 'git-messenger:popup-message)

;; Multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Pony mode
(global-set-key (kbd "C-c pm") 'pony-tpl-mode)

;; Commenting
(global-set-key (kbd "C-x /") 'comment-or-uncomment-region-or-line)

;; Buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c n") 'cleanup-buffer)

(global-set-key (kbd "C-o") 'gc/new-line-below)
(global-set-key (kbd "M-o") 'gc/new-line-above)
(global-set-key (kbd "C-c w") 'delete-trailing-whitespace)

(provide 'init-key-bindings)
