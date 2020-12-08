{ config, pkgs, lib, ... }:
{
  programs.emacs.init.usePackage = {
    nix-mode = {
      enable = true;
      mode = [ ''"\\.nix\\'"'' ];
    };

    lsp-mode.hook = [ "(nix-mode . lsp-deferred)" ];
    lsp-mode.extraConfig = ''
      :custom
      (lsp-nix-server-path "${pkgs.rnix-lsp}/bin/rnix-lsp")
    '';
  };
}
