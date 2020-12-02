{ config, pkgs, lib, ... }:
{
  programs.emacs.init.usePackage = {

    initchart = {
      enable = true;
    };
    
    general = {
      enable = true;
      config = "(general-override-mode)";
    };

    hydra = {
      enable = true;
    };

    undo-fu-session = {
      enable = true;
      config = "(global-undo-fu-session-mode)";
    };

    evil = {
      enable = true;
      config = "(evil-mode 1)";
      extraConfig = ''
        :custom
        (evil-want-C-u-scroll t)
        (evil-undo-system 'undo-fu)
      '';
    };

    which-key = {
      enable = true;
      config = ''
        (which-key-setup-side-window-bottom)
        (which-key-mode)
      '';
    };

    counsel = {
      enable = true;
      config = "(ivy-mode 1)";
      extraConfig = ''
        :custom
        (ivy-hight 15)
        (ivy-use-virtual-buffers t)
        :general
        ("C-s" 'swiper)
        ("M-x" 'counsel-M-x)
        ("C-x C-f" 'counsel-find-file)
        ("M-y" 'counsel-yank-pop)
        ("C-h f" 'counsel-describe-function)
        ("C-h v" 'counsel-describe-variable)
        ("C-x b" 'ivy-switch-buffer)
      '';
    };

    restart-emacs = {
      enable = true;
    };

    winum = {
      enable = true;
      config = "(winum-mode)";
    };

    git-gutter = {
      enable = true;
      config = "(global-git-gutter-mode t)";
    };

    magit = {
      enable = true;
      config = "(require 'evil-magit)";
      extraConfig = ''
        :custom
        (evil-magit-state 'normal)
        (evil-magit-use-y-for-yank t)
      '';
    };

    evil-magit = {
      enable = true;
    };

    treemacs = {
      enable = true;
      extraConfig = ''
        :custom
        (treemacs-width 30)
        (treemacs-indentation 1)
        (treemacs-python-executable "${pkgs.python3}/bin/python")
        :general
        ("C-x w 0" 'treemacs-select-window)
      '';
      config = "(require 'treemacs-evil)";
    };

    treemacs-evil = {
      enable = true;
    };

    vterm = {
      enable = true;
      config = ''
        (evil-set-initial-state 'vterm-mode 'insert)
      '';
    };

    vterm-toggle = {
      enable = true;
      config = ''
        (add-to-list
         'display-buffer-alist
         '((lambda (bufname _)
             (with-current-buffer bufname
	         (equal major-mode 'vterm-mode)))
           (display-buffer-reuse-window display-buffer-at-bottom)
           (reusable-frames . visible)
           (window-height . 0.3)))
      '';
      extraConfig = ''
        :custom
        (vterm-toggle-fullscreen-p nil)
        (vterm-toggle-use-dedicated-buffer t)
        (vterm-toggle-reset-window-configration-after-exit t)
      '';
    };

    eshell-toggle = {
      enable = true;
      extraConfig = ''
        :custom
        (eshell-toggle-size-fraction 3)
        (eshell-toggle-use-projectile-root t)
        (eshell-toggle-run-command nil)
      '';
    };

    smartparens = {
      enable = true;
      hook = [ "(emacs-lisp-mode . smartparens-mode)" ];
      config = "(require 'smartparens-config)";
      extraConfig = ''
        :general 'visual
        ("M-(" 'sp-wrap-round)
        ("M-[" 'sp-wrap-square)
        ("M-{" 'sp-wrap-curly)
        ("M-<" #'(lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "<")))
        ("M-'" #'(lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "'")))
        ("M-\"" #'(lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "\"")))
      '';
    };

    skk = {
      package = "ddskk";
      enable = true;
      extraConfig = ''
        :custom
        (default-input-method "japanese-skk")
        (skk-jisyo-code 'utf-8-unix)
        (skk-large-jisyo "${pkgs.skk-dicts}/share/SKK-JISYO.combined")
      '';
    };

    migemo = with pkgs; {
      enable = true;
      extraConfig = ''
        :custom
        (migemo-options '("-q" "--emacs"))
        (migemo-user-dictionary nil)
        (migemo-regex-dictionary nil)
        (migemo-command "${cmigemo}/bin/cmigemo")
        (migemo-dictionary "${cmigemo}/share/migemo/utf-8/migemo-dict")
      '';
    };

    doom-modeline = {
      enable = true;
      config = "(doom-modeline-mode 1)";
    };

    doom-themes = {
      enable = true;
      config = ''
        (load-theme 'doom-opera t)
        (doom-themes-treemacs-config)
      '';
      extraConfig = ''
        :custom
        (doom-themes-enable-bold t)
        (doom-themes-enable-italic t)
        (doom-themes-treemacs-theme "doom-colors")
      '';
    };

    ivy-rich = {
      enable = true;
      hook = [ "(ivy-mode . ivy-rich-mode)" ];
    };

    nix-mode = {
      enable = true;
      mode = [ ''"\\.nix\\'"'' ];
    };

    fish-mode = {
      enable = true;
      mode = [ ''"\\.fish\\'"'' ];
    };
  };
}
