(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the active region, or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun toggle-comment-on-line ()
  "Comment or un-comment current line."
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (indent-buffer))


(provide 'init-buffers)
