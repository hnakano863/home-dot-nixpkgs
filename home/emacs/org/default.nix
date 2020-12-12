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

    org-pomodoro = {
      enable = true;
      command = [ "org-pomodoro" ];
      extraConfig = ''
        :custom
        (org-pomodoro-format "🍅~%s")
        (org-pomodoro-length 20)
        (org-pomodoro-play-sounds nil)
      '';
      hook = [
        "(org-pomodoro-started . parrot-stop-animation)"
        "(org-pomodoro-finished . parrot-start-animation)"
      ];
    };

    smartparens.hook = [ "(org-mode . smartparens-mode)" ];
  };
}
