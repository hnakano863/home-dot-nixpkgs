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

    org-journal = {
      enable = true;
      command = [ "org-journal-new-entry" ];
      extraConfig = ''
        :custom
        (org-journal-file-type 'weekly)
        (org-journal-file-format "%Y-%m-%d")
        (org-journal-dir (concat "~/Org/journal/" (format-time-string "%Y" (current-time))))
      '';
    };

    smartparens.hook = [ "(org-mode . smartparens-mode)" ];
  };
}
