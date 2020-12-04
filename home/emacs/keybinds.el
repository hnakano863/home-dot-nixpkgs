(general-create-definer my-bind
  :states '(motion normal)
  :keymaps 'override)

;; root keybinds
(my-bind
  :prefix "SPC"
  "" nil
  "b" '(:ignore t :wk "buffer")
  "f" '(:ignore t :wk "file")
  "w" '(:ignore t :wk "window")
  "h" '(:ignore t :wk "help")
  "q" '(:ignore t :wk "quit")
  "g" '(:ignode t :wk "git")
  "t" '(:ignore t :wk "toggle")
  :keymaps 'projectile-mode-map
  "p" '(:keymap projectile-command-map :wk "projectile")
  "e" '(hydra-smartparens-edit/body t :wk "edit"))
  ;"RET" 'vterm-toggle)

;; buffer related keybinds
(my-bind
  :prefix "SPC b"
  "b" 'ivy-switch-buffer
  "d" 'kill-current-buffer
  "l" 'evil-switch-to-windows-last-buffer)

;; file related keybinds
(my-bind
 :prefix "SPC f"
 "f" 'counsel-find-file
 "r" 'counsel-recentf
 "t" 'treemacs)
		 
;; window related keybinds
(my-bind
  :prefix "SPC w"
  "h" 'evil-window-left
  "j" 'evil-window-down
  "k" 'evil-window-up
  "l" 'evil-window-right
  "H" 'evil-window-move-far-left
  "J" 'evil-window-move-very-bottom
  "K" 'evil-window-move-very-top
  "L" 'evil-window-move-far-right
  "s" 'evil-window-split
  "v" 'evil-window-vsplit
  "d" 'evil-window-delete
  "D" 'delete-other-windows
  "0" 'treemacs-select-window
  "1" 'winum-select-window-1
  "2" 'winum-select-window-2
  "3" 'winum-select-window-3
  "4" 'winum-select-window-4
  "5" 'winum-select-window-5
  "6" 'winum-select-window-6
  "7" 'winum-select-window-7
  "8" 'winum-select-window-8
  "9" 'winum-select-window-9
  "w" 'winum-select-window-by-number)

;; help related keybinds
(my-bind
  :prefix "SPC h"
  "f" 'counsel-describe-function
  "v" 'counsel-describe-variable
  "k" 'describe-key
  "m" 'describe-mode)

;; quit related keybinds
(my-bind
  :prefix "SPC q"
  "q" 'save-buffers-kill-terminal
  "Q" 'evil-quit-all-with-error-code
  "r" 'restart-emacs
  "R" '((lambda () (interactive "P") (restart-emacs '("--debug-init")))
	:wk "restart-debug-init"))

;; git keybinds
(my-bind
  :prefix "SPC g"
  "g" 'magit-status
  "s" 'magit-status
  "h" 'hydra-git-gutter/body)

;; toggle keybinds
(my-bind
  :prefix "SPC t"
  "t" 'toggle-truncate-lines
  "l" 'display-line-numbers-mode
  "f" 'treemacs)
  ;"v" 'vterm-toggle)