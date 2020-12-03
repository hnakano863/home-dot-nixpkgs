{ config, pkgs, lib, ... }:
{
  programs.emacs.init.usePackage = {

    general.enable = true;
    hydra.enable = true;
    restart-emacs.enable = true;

    git-gutter.enable = true;
    git-gutter.config = "(global-git-gutter-mode t)";

    undo-fu.enable = true;
    undo-fu-session.enable = true;
    undo-fu-session.config = "(global-undo-fu-session-mode 1)";

    winum.enable = true;
    winum.config = "(winum-mode)";

    which-key.enable = true;
    which-key.config = ''
      (which-key-setup-side-window-bottom)
      (which-key-mode)
    '';

    evil = {
      enable = true;
      config = ''
        (evil-mode 1)
      '';
      extraConfig = ''
        :custom
        (evil-want-C-u-scroll t)
        (evil-undo-system 'undo-fu)
      '';
    };

    counsel = {
      enable = true;
      demand = true;
      config = ''
        (ivy-mode 1)
      '';
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

    ivy-prescient.enable = true;
    ivy-prescient.config = "(ivy-prescient-mode 1)";

    ivy-rich.enable = true;
    ivy-rich.config = "(ivy-rich-mode 1)";
    
    projectile = {
      enable = true;
      extraPackages = with pkgs; [
        git fd ripgrep
      ];
      config = ''
        (projectile-mode 1)
      '';
      extraConfig = ''
        :custom
        (projectile-indexing-method 'alien)
        (projectile-sort-order 'recentf-active)
      '';
    };

    magit = {
      enable = true;
      config = ''
        (require 'evil-magit)
      '';
      extraConfig = ''
        :custom
        (evil-magit-state 'normal)
        (evil-magit-use-y-for-yank t)
      '';
    };
    evil-magit.enable = true;

    treemacs = {
      enable = true;
      config = ''
        (treemacs-git-mode 'deferred)
      '';
      extraConfig = ''
        :custom
        (treemacs-width 30)
        (treemacs-python-executable "${pkgs.python3}/bin/python")
      '';
    };
    treemacs-evil.enable = true;
    treemacs-projectile.enable = true;
    treemacs-magit.enable = true;

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
        (skk-jisyo-code 'utf-8-unix)
        (skk-large-jisyo "${pkgs.skk-dicts}/share/SKK-JISYO.L")
      '';
    };

    posframe.enable = true;
    ddskk-posframe.enable = true;
    ddskk-posframe.hook = [ "(skk-mode . ddskk-posframe-mode)" ];

    nix-mode.enable = true;
    nix-mode.mode = [ ''"\\.nix\\'"'' ];

    fish-mode.enable = true;
    fish-mode.mode = [ ''"\\.fish\\'"'' ];
  };
}
