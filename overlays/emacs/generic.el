(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq auto-save-list-file-prefix nil)
(setq recentf-save-file
      (expand-file-name
       (concat (temporary-file-directory)
	       "recentf")))

(if (alist-get 'font default-frame-alist)
    (setf (alist-get 'font default-frame-alist) "Cica-12")
  (add-to-list 'default-frame-alist
	       '(font . "Cica-12")))
