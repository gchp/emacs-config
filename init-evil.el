(require-package 'evil)
(require-package 'surround)

;; Set modeline colors depending on evil mode
;; Insert - green
;; Normal - gray22
;; Visual - yellow
;; Normal & unsaved changes - red
(lexical-let ((default-color (cons (face-background 'mode-line)
                                   (face-foreground 'mode-line))))
  (add-hook 'post-command-hook
            (lambda ()
              (let ((color (cond ((minibufferp) default-color)
                                 ((evil-insert-state-p) '("#40b83e" . "#26292c"))
                                 ((evil-emacs-state-p)  '("gray22"  . "#26292c"))
                                 ((evil-visual-state-p) '("#f6f080" . "#26292c"))
                                 ((buffer-modified-p)   '("#ff4a52" . "#26292c"))
                                 (t default-color))))
                (set-face-background 'mode-line (car color))
                (set-face-foreground 'mode-line (cdr color))))))

;; Initialize evil mode
(evil-mode 1)
(global-surround-mode 1)

(provide 'init-evil)
