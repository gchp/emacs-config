(require-package 'evil)

(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
            (lambda ()
              (let ((color (cond ((minibufferp) default-color)
                                 ((evil-insert-state-p) '("#40b83e" . "#ffffff"))
                                 ((evil-emacs-state-p)  '("gray22" . "#ffffff"))
                                 ((buffer-modified-p)   '("#ff4a52" . "#f0dfaf"))
                                 (t default-color))))
                (set-face-background 'mode-line (car color))
                (set-face-foreground 'mode-line (cdr color))))))

(provide 'init-evil)
