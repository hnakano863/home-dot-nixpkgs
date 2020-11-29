(use-package general
  :config (general-override-mode))
(use-package undo-fu)
(use-package undo-fu-session
  :custom
  (undo-fu-session-directory "/tmp/undo-fu-session")
  :config
  (global-undo-fu-session-mode))

(use-package evil
  :custom
  (evil-want-C-u-scroll t)
  (evil-undo-system 'undo-fu)
  :after (undo-fu)
  :config (evil-mode 1))

(use-package hydra)
(use-package which-key
  :config
  (which-key-setup-side-window-bottom)
  (which-key-mode))

(use-package counsel
  :custom
  (ivy-hight 15)
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) ")
  :config (ivy-mode 1)
  :general
  ("C-s" 'swiper)
  ("M-x" 'counsel-M-x)
  ("C-x C-f" 'counsel-find-file)
  ("M-y" 'counsel-yank-pop)
  ("C-h f" 'counsel-describe-function)
  ("C-h v" 'counsel-describe-variable)
  ("C-x b" 'ivy-switch-buffer))

(use-package restart-emacs)
(use-package winum
  :config (winum-mode))

(use-package git-gutter
  :config (global-git-gutter-mode t))
(use-package magit)
(use-package evil-magit
  :after (evil magit)
  :custom
  (evil-magit-state 'normal)
  (evil-magit-use-y-for-yank t))

(use-package treemacs
  :after (winum)
  :custom
  (treemacs-width 30)
  (treemacs-indentation 1)
  :general
  ("C-x w 0" 'treemacs-select-window))
(use-package treemacs-evil)
(use-package vterm
  :after evil
  :config
  (evil-set-initial-state 'vterm-mode 'insert))

(use-package vterm-toggle
  :custom
  (vterm-toggle-fullscreen-p nil)
  (vterm-toggle-use-dedicated-buffer t)
  (vterm-toggle-reset-window-configration-after-exit t)
  :config
  (add-to-list
   'display-buffer-alist
   '((lambda (bufname _)
       (with-current-buffer bufname
	 (equal major-mode 'vterm-mode)))
     (display-buffer-reuse-window display-buffer-at-bottom)
     (reusable-frames . visible)
     (window-height . 0.3))))

(use-package smartparens
  :hook ((emacs-lisp-mode . smartparens-mode))
  :config (require 'smartparens-config)
  :general 'visual
  ("M-(" 'sp-wrap-round)
  ("M-[" 'sp-wrap-square)
  ("M-{" 'sp-wrap-curly)
  ("M-<" #'(lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "<")))
  ("M-'" #'(lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "'")))
  ("M-\"" #'(lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "\""))))

(use-package skk
  :custom
  (default-input-method "japanese-skk")
  (skk-jisyo-code 'utf-8-unix))

(use-package migemo
  :custom
  (migemo-options '("-q" "--emacs"))
  (migemo-user-dictionary nil)
  (migemo-regex-dictionary nil)
  (migemo-coding-system 'utf-8-unix)
  :config
  (migemo-init))

(use-package my-ivy-migemo
  :config
  (if (alist-get 'swiper ivy-re-builders-alist)
      (setf (alist-get 'swiper ivy-re-builders-alist)
	    #'my/ivy--regex-migemo-plus)
    (add-to-list 'ivy-re-builders-alist
		 '(swiper . my/ivy--regex-migemo-plus))))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package fish-mode
  :mode "\\.fish\\'")

