(use-package general
  :config (general-override-mode))

(use-package undo-fu-session
  :custom
  (undo-fu-session-directory "/tmp/undo-fu-session")
  :config
  (global-undo-fu-session-mode))

(use-package evil
  :custom
  (evil-want-C-u-scroll t)
  (evil-undo-system 'undo-fu)
  :config (evil-mode 1))

(use-package which-key
  :config
  (which-key-setup-side-window-bottom)
  (which-key-mode))

(use-package counsel
  :defer t
  :custom
  (ivy-hight 15)
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) ")
  (ivy-re-builders-alist '((swiper . my/ivy--regex-migemo-plus)
			   (t . ivy--regex-plus)))
  :config
  (require 'my-ivy-migemo)
  (ivy-mode 1)
  :general
  ("C-s" 'swiper)
  ("M-x" 'counsel-M-x)
  ("C-x C-f" 'counsel-find-file)
  ("M-y" 'counsel-yank-pop)
  ("C-h f" 'counsel-describe-function)
  ("C-h v" 'counsel-describe-variable)
  ("C-x b" 'ivy-switch-buffer))

(use-package restart-emacs
  :defer t)

(use-package winum
  :config (winum-mode))

(use-package git-gutter
  :config (global-git-gutter-mode t))

(use-package magit
  :defer t
  :custom
  (evil-magit-state 'normal)
  (evil-magit-use-y-for-yank t)
  :config
  (require 'evil-magit))

(use-package treemacs
  :after (winum evil)
  :custom
  (treemacs-width 30)
  (treemacs-indentation 1)
  :general
  ("C-x w 0" 'treemacs-select-window)
  :config
  (require 'treemacs-evil))

(use-package vterm
  :defer t
  :config
  (evil-set-initial-state 'vterm-mode 'insert))

(use-package vterm-toggle
  :defer t
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

(use-package eshell-toggle
  :defer t
  :custom
  (eshell-toggle-size-fraction 3)
  (eshell-toggle-use-projectile-root t)
  (eshell-toggle-run-command nil))

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
  :defer t
  :custom
  (default-input-method "japanese-skk")
  (skk-jisyo-code 'utf-8-unix))

(use-package migemo
  :defer t
  :custom
  (migemo-options '("-q" "--emacs"))
  (migemo-user-dictionary nil)
  (migemo-regex-dictionary nil)
  (migemo-coding-system 'utf-8-unix))

(use-package doom-modeline
  :config
  (doom-modeline-mode 1))

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  (doom-themes-treemacs-theme "doom-colors")
  :config
  (load-theme 'doom-opera t)
  (doom-themes-treemacs-config))

(use-package ivy-rich
  :hook (ivy-mode . ivy-rich-mode))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package fish-mode
  :mode "\\.fish\\'")
