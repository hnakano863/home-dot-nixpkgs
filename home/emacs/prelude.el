;; initchart setup
(require 'initchart)
(initchart-record-execution-time-of load file)
(initchart-record-execution-time-of require feature)

;; some constants setup
(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      auto-save-list-file-prefix nil
      read-process-output-max (* 3 1024 1024))

;; ui setup
(blink-cursor-mode -1)
(global-hl-line-mode 1)
(make-variable-buffer-local 'global-hl-line-mode)
(add-hook 'term-mode-hook (lambda () (setq-local global-hl-line-mode nil)))

;; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; require for configuration
(require 'general)
(require 'hydra)

;; recentf-mode
(add-hook 'emacs-startup-hook '(lambda () (recentf-mode +1)))

;;; prelude.el ends here.
