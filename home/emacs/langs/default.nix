{ config, pkgs, lib, ... }:
{
  imports = [
    ./elisp
    ./nix
    ./fish
  ];

  programs.emacs.init.usePackage = {
    smartparens.enable = true;
    smartparens.config = "(require 'smartparens-config)";

    company = {
      enable = true;
      extraConfig = ''
        :general
        (:keymaps 'company-active-map
          "C-n" 'company-select-next
          "C-p" 'company-select-previous)
      '';
    };
  };
}
