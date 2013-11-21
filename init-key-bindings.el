(require-package 'key-chord)

;; Enable key-chord for keybindings
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)

;; map jk to exit insert mode in evil
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;; restore Control-e in evil-mode
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C--") 'er/contract-region)

;; Magit
(key-chord-define evil-normal-state-map "gs" 'magit-status)
(global-set-key (kbd "C-x m") 'magit-status)

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
