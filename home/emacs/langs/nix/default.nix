{ config, pkgs, lib, ... }:
{
  programs.emacs.init.usePackage = {
    nix-mode = {
      enable = true;
      mode = [ ''"\\.nix\\'"'' ];
    };
  };
}
