{ config, pkgs, lib, ... }:
{
  programs.emacs.init.usePackage = {
    julia-mode = {
      enable = true;
      mode = [ ''"\\.jl\\'"'' ];
    };
  };
}
