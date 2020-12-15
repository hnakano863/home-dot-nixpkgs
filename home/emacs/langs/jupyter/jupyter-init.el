(defun my/jupyter-command-advice (orig-fun &rest args)
  (with-temp-buffer
    (when (zerop (apply #'process-file jupyter-executable nil t nil args))
      (string-trim-right (buffer-string)))))

(defun my/org-babel-execute-src-block-advice (&optional arg info params)
  (unless (featurep 'ob-jupyter)
    (require 'ob-jupyter)))

(advice-add 'jupyter-command :around #'my/jupyter-command-advice)
(advice-add 'org-babel-execute-src-block :before #'my/org-babel-execute-src-block-advice)
