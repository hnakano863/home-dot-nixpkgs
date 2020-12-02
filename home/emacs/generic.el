(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq auto-save-list-file-prefix nil)
(setq recentf-save-file
      (expand-file-name
       (concat (temporary-file-directory)
	       "recentf")))

(add-to-list 'default-frame-alist
	     '(font . "Cica-12"))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
