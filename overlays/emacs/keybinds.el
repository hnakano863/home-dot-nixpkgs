;; root keybinds
(general-def 'motion
  :prefix "SPC"
  "" nil
  "b" '(:ignore t :wk "buffer")
  "f" '(:ignore t :wk "file")
  "w" '(:ignore t :wk "window")
  "h" '(:ignore t :wk "help")
  "q" '(:ignore t :wk "quit")
  "g" '(:ignode t :wk "git")
  "t" '(:ignore t :wk "toggle")
  "RET" 'vterm-toggle)

;; buffer related keybinds
(general-def 'motion
  :prefix "SPC b"
  "b" 'ivy-switch-buffer
  "d" 'kill-current-buffer
  "l" 'evil-switch-to-windows-last-buffer)

;; file related keybinds
(general-def 'motion
 :prefix "SPC f"
 "f" 'counsel-find-file
 "r" 'counsel-recentf
  "t" 'treemacs)
		 
;; window related keybinds
(general-def 'motion
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
(general-def 'motion
  :prefix "SPC h"
  "f" 'counsel-describe-function
  "v" 'counsel-describe-variable
  "k" 'describe-key
  "m" 'describe-mode)

;; restart-debug-init
(defun restart-debug-init ()
  (interactive)
  (restart-emacs '("--debug-init")))

;; quit related keybinds
(general-def 'motion
  :prefix "SPC q"
  "q" 'save-buffers-kill-terminal
  "Q" 'evil-quit-all-with-error-code
  "r" 'restart-emacs
  "R" 'restart-debug-init)

;; git keybinds
(general-def 'motion
  :prefix "SPC g"
  "g" 'magit-status
  "s" 'magit-status
  "h" 'hydra-git-gutter/body)

;; toggle keybinds
(general-create-definer toggle-leader-def
  :prefix "SPC t"
  :states 'motion)

(toggle-leader-def
  "t" 'toggle-truncate-lines
  "l" 'display-line-numbers-mode
  "f" 'treemacs
  "v" 'vterm-toggle)

;; unbind magit map
(general-unbind 'evil-magit-state magit-mode-map
  "SPC"
  "S-SPC")
