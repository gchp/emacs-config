(require-package 'zenburn-theme)

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; load zenburn theme
(load-theme 'zenburn t)

;; set font
(set-default-font "Source Code Pro-9")
(setq default-frame-alist '((font . "Source Code Pro-9")))

;; Indentation
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;; emacs powerline
(require 'powerline)
(setq powerline-color1 "gray30")
(setq powerline-color2 "gray45")
(set-face-attribute 'mode-line nil
                    :background "gray22"
                    :foreground "F0DFAF"
                    :box nil)

(column-number-mode t)
(global-visual-line-mode t)
(mouse-avoidance-mode 'banish)
