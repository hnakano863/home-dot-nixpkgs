{ config, pkgs, lib, ... }:
with lib;
with pkgs;
{
  programs.emacs.init.usePackage = {
    org-mode = {
      enable = true;
      package = "org";
      mode = [ ''"\\.org\\'"'' ];
      init = readFile ./org-init.el;
    };

    org-bullets = {
      enable = true;
      hook = [ "(org-mode . org-bullets-mode)" ];
      extraConfig = ''
        :custom
        (org-bullets-bullet-list '("✿" "◉" "✸" "○"))
      '';
    };

    org-journal.enable = true;
    org-journal.command = [ "org-journal-new-entry" ];

    smartparens.hook = [ "(org-mode . smartparens-mode)" ];
  };
}
