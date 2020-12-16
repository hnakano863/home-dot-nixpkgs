{ config, pkgs, lib, ... }:
{
  imports = [
    ./elisp
    ./fish
    ./julia
    ./jupyter
    ./nix
    ./python
    ./rust
  ];

  programs.emacs.init.usePackage = {
    smartparens.enable = true;
    smartparens.config = "(require 'smartparens-config)";

    flycheck.enable = true;
    flycheck.config = ''
      (require 'pkg-info)
    '';

    company = {
      enable = true;
      extraConfig = ''
        :general
        (:keymaps 'company-active-map
          "C-n" 'company-select-next
          "C-p" 'company-select-previous)
      '';
    };

    yasnippet.enable = true;
    yasnippet.defer = true;

    lsp-mode = {
      enable = true;
      command = [ "lsp" "lsp-deferred" ];
      hook = [ "(lsp-mode . lsp-enable-which-key-integration)" ];
      config = ''
        (require 'lsp-modeline)
      '';
      extraConfig = ''
        :custom
        (lsp-keymap-prefix "C-c C-l")
        (lsp-auto-configure t)
        :general
        (:keymaps 'lsp-mode-map
        "C-c l" '(:keymap lsp-command-map :wk "+lsp"))
      '';
    };

    lsp-ui = {
      enable = true;
      command = [ "lsp-ui-mode" ];
      extraConfig = ''
        :custom
        (lsp-ui-sideline-show-hover t)
      '';
    };

    lsp-ivy = {
      enable = true;
      command = [ "lsp-ivy-workspace-symbol" ];
    };

    envrc = {
      enable = true;
      config = ''
        (envrc-global-mode 1)
      '';
    };

  };
}
