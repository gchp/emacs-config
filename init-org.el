(require-package 'org)

(require 'ox-latex)

;; Store a note with completed tasks
(setq org-log-done 'note)

;; Syntax coloring in PDF generation
(add-to-list 'org-latex-packages-alist '("" "minted"))
  (setq org-latex-listings 'minted)
  (setq org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

(provide 'init-org)
