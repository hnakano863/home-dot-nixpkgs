{ config, pkgs, lib, ... }:
with pkgs;
{
  programs.emacs.init.usePackage = {

    general.enable = true;
    hydra.enable = true;
    restart-emacs.enable = true;
    restart-emacs.command = [ "restart-emacs" ];
    initchart.enable = true;

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
      command = [
        "counsel-recentf"
      ];
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
    ivy-prescient.hook = [ "(ivy-mode . ivy-prescient-mode)" ];

    ivy-rich.enable = true;
    ivy-rich.hook = [ "(ivy-mode . ivy-rich-mode)" ];
    
    projectile = {
      enable = true;
      extraPackages = [
        git fd ripgrep
      ];
      hook = [ "(ivy-mode . projectile-mode)" ];
      extraConfig = ''
        :custom
        (projectile-indexing-method 'alien)
        (projectile-sort-order 'recentf-active)
      '';
    };

    magit = {
      enable = true;
      command = [ "magit-status" ];
      config = "(require 'evil-magit)";
    };

    evil-magit ={
      enable = true;
      defer = true;
      extraConfig = ''
        :custom
        (evil-magit-state 'normal)
        (evil-magit-use-y-for-yank t)
      '';
    };

    treemacs = {
      enable = true;
      command = [
        "treemacs"
        "treemacs-select-window"
      ];
      config = ''
        (treemacs-git-mode 'deferred)
        (require 'treemacs-evil)
        (require 'treemacs-magit)
        (require 'treemacs-projectile)
      '';
      extraConfig = ''
        :custom
        (treemacs-width 30)
        (treemacs-python-executable "${python3}/bin/python")
      '';
    };
    treemacs-evil.enable = true;
    treemacs-evil.defer = true;
    treemacs-projectile.enable = true;
    treemacs-projectile.defer = true;
    treemacs-magit.enable = true;
    treemacs-magit.defer = true;

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
      defer = true;
      enable = true;
      extraConfig = ''
        :custom
        (skk-jisyo-code 'utf-8-unix)
        (skk-large-jisyo "${skk-dicts}/share/SKK-JISYO.L")
        (default-input-method "japanese-skk")
      '';
    };

    posframe.enable = true;
    posframe.defer = true;
    ddskk-posframe.enable = true;
    ddskk-posframe.hook = [ "(skk-mode . ddskk-posframe-mode)" ];

    migemo = with pkgs; {
      enable = true;
      defer = true;
      extraConfig = ''
        :custom
        (migemo-options '("-q" "--emacs"))
        (migemo-user-dictionary nil)
        (migemo-regex-dictionary nil)
        (migemo-command "${cmigemo}/bin/cmigemo")
        (migemo-dictionary "${cmigemo}/share/migemo/utf-8/migemo-dict")
      '';
    };

    my-ivy-migemo = {
      enable = true;
      command = [ "my/ivy--regex-migemo-plus" ];
      extraConfig = ''
        :custom
        (ivy-re-builders-alist '((counsel-find-file . my/ivy--regex-migemo-plus)
                                 (counsel-recentf . my/ivy--regex-migemo-plus)
                                 (swiper . my/ivy--regex-migemo-plus)
                                 (t . ivy--regex-plus)))
      '';
    };

    all-the-icons.enable = true;
    all-the-icons.extraPackages = [ emacs-all-the-icons-fonts ];
    
    doom-themes = {
      enable = true;
      config = ''
        (load-theme 'doom-opera t)
        (require 'doom-themes-ext-treemacs)
        (doom-themes-treemacs-config)
      '';
      extraConfig = ''
        :custom
        (doom-themes-treemacs-theme "doom-colors")
      '';
    };

    doom-modeline.enable = true;
    doom-modeline.config = "(doom-modeline-mode 1)";

    hide-mode-line = {
      enable = true;
      hook = [ "(help-mode . hide-mode-line-mode)"
               "(vterm-mode . hide-mode-line-mode)" ];
    };

    shackle = {
      enable = true;
      config = "(shackle-mode 1)";
      extraConfig = ''
        :custom
        (shackle-rules '(("*Help*" :align below :size 0.42 :select t :popup t)
                         (magit-status-mode :align right :select t :popup t)
                         (vterm-mode :align below :size 0.35 :select t :popup t)))
      '';
    };

    vterm.enable = true;
    vterm.defer = true;
    vterm-toggle = {
      enable = true;
      after = [ "evil" ];
      command = [ "vterm-toggle" ];
      config = "(evil-set-initial-state 'vterm-mode 'insert)";
      extraConfig = ''
        :custom
        (vterm-toggle-cd-auto-create-buffer t)
      '';
    };

    nix-mode.enable = true;
    nix-mode.mode = [ ''"\\.nix\\'"'' ];

    fish-mode.enable = true;
    fish-mode.mode = [ ''"\\.fish\\'"'' ];
  };
}
