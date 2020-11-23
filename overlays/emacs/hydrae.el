;;; hydra-git-gutter
;; toggle git-gutter popup window
(defun my--git-gutter:toggle-popup-hunk ()
  (interactive)
  (if (window-live-p (git-gutter:popup-buffer-window))
      (delete-window (git-gutter:popup-buffer-window))
    (git-gutter:popup-hunk)))

;; hydra maps
(defhydra hydra-git-gutter (:color red :hint nil)
  "
_j_: next _k_: previous _s_: stage _r_: revert _d_: popup diff _RET_: toggle diff"
  ("j" git-gutter:next-hunk)
  ("k" git-gutter:previous-hunk)
  ("s" git-gutter:stage-hunk)
  ("r" git-gutter:revert-hunk)
  ("d" git-gutter:popup-hunk)
  ("RET" my--git-gutter:toggle-popup-hunk))
