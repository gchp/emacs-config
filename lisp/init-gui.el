(require-package 'flatland-theme)
(require-package 'zenburn-theme)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))

;; Indentation
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(defun init-powerline ()
    (require 'powerline)
    (setq powerline-color1 "gray30")
    (setq powerline-color2 "gray45")
    (set-face-attribute 'mode-line nil
                        :background "gray22"
                        :foreground "F0DFAF"
                        :box nil)
)

(defun init-modeline ()
  (setq-default mode-line-format
      (list
       '(:eval (propertize "%b " 'face 'font-lock-keyword-face 'help-echo (buffer-file-name)))

       "("
          (propertize "%02l" 'face 'font-lock-type-face) ","
          (propertize "%02c" 'face 'font-lock-type-face)
       ") "

       "["
          (propertize "%p" 'face 'font-lock-constant-face) "/"
          (propertize "%I" 'face 'font-lock-constant-face)
       "] "

       "["
          '(:eval (propertize "%m" 'face 'font-lock-string-face 'help-echo buffer-file-coding-system))
       "] "

       '(:eval (propertize (format-time-string "%H:%M")
              'help-echo
              (concat (format-time-string "%c; ")
                      (emacs-uptime "Uptime:%hh"))))

        " --"
        ;; i don't want to see minor-modes; but if you want, uncomment this:
        ;; minor-mode-alist  ;; list of minor modes
        "%-" ;; fill with '-'
  ))
)

;; show marker in left frint for lines not in buffer
(setq indicate-empty-lines t)

;; suppress GUI Features
(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)

;; (column-number-mode t)
;; (global-visual-line-mode -1)

(defun init-theme ()
  (load-theme 'flatland t))

(defun init-fonts ()
  (set-frame-font "Droid Sans Mono-8")
  (add-to-list 'default-frame-alist '(font . "Droid Sans Mono-8")))


(defun init-gui-customisations ()
  (init-theme)
  (init-modeline)
  (setq-default line-spacing 2)
  (init-fonts))

(add-hook 'after-init-hook 'init-gui-customisations)

(provide 'init-gui)
