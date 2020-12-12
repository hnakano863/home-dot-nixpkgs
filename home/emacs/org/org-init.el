;;; org-init.el --- org-mode config before package loading.

;;; Commentary:
;;; This file is for configuration about org-mode.
;;; The codes below are executed before loading org-mode.

;;; Code:

;; startup setup
(setq org-startup-indented t
      org-startup-folded nil)

;; setup for appearance
(setq org-indent-indentation-per-level 1
      org-hide-emphasis-markers t
      org-pretty-entities t
      org-fontify-quote-and-verse-blocks t)

;; setup for files and directories
(setq org-directory "~/Org"
      org-agenda-files '("~/Org/notes.org"
			 "~/Org/knowledge/org-mode.org")
      org-refile-targets '((org-agenda-files :maxlevel . 1))
      org-default-notes-file "~/Org/notes.org"
      org-archive-location (concat org-directory
				   "/archives/%s_archive_"
				   (format-time-string "%Y" (current-time))
				   "::"))

;; setup for org-todo
(setq org-todo-keywords
      '((sequence "TODO(t)"
                  "STRT(s)"
                  "WAIT(w)"
                  "HOLD(h)"
                  "|"
                  "DONE(d)"
                  "KILL(k)"))
      org-todo-keyword-faces
      '(("TODO" . org-todo)
	("STRT" . org-todo)
	("WAIT" . warning)
	("HOLD" . warning)))

;; setup for org-capture template
(setq org-capture-templates
      '(("t" "Task" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?\n:PROPERTIES:\n:Entered:  %U\n:END:\n%i\n")
        ("n" "Note" entry (file+headline org-default-notes-file "Notes")
         "* %?\n:PROPERTIES:\n:Entered:  %U\n:END:\n%i\n")))

;; setup for org-journal
(setq org-journal-dir (concat org-directory
			      "/journal/"
			      (format-time-string "%Y" (current-time)))
      org-journal-file-type 'weekly
      org-journal-file-format "%Y-%m-%d")

;;; org-init.el ends here.
