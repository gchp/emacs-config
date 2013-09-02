;; Bind C-@ to expand region
(global-set-key (kbd "C-@") 'er/expand-region)

;; Bind C-c C-s cs ("|') to toggle surrounding quotes
(global-set-key (kbd "C-c C-s cs \"") 'surround-change-double-quote)
(global-set-key (kbd "C-c C-s cs '") 'surround-change-single-quote)


(provide 'key-bindings)
