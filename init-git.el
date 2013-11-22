(require-package 'magit)
(require-package 'magit-svn)
(require-package 'git-gutter-fringe)
(require-package 'git-messenger)

;; Set up magit to work with git-svn repos
(add-hook 'magit-mode-hook 'magit-load-config-extensions)

;; Use fringe version of git-gutter
(after-load 'git-gutter
  (require 'git-gutter-fringe))

(provide 'init-git)
