(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
     '(progn ,@body)))

(defun gc/open-config-file ()
  "Quickly open the main config file"
  (interactive)
  (find-file user-init-file))


(provide 'init-utils)
