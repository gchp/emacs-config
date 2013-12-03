(require-package 'key-chord)

;; Enable key-chord for keybindings
(key-chord-mode 1)

;; (setq key-chord-two-keys-delay 0.5)

; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status)
(key-chord-define-global "gm" 'git-messenger:popup-message)
(key-chord-define-global "gb" 'git-blame-mode)

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

(provide 'init-key-bindings)
