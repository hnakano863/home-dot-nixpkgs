{ config, pkgs, lib, ... }:
with lib;
let
  readFile = builtins.readFile;
in
{
  imports = [
    ./packages.nix
    ./langs
  ];

  programs.emacs.enable = true;
  programs.emacs.overrides = import ./overrides { inherit pkgs; };

  programs.emacs.init = {
    enable = true;
    startupTimer = true;

    recommendedGcSettings = true;

    earlyInit = ''
      (push '(menu-bar-lines . 0) default-frame-alist)
      (push '(tool-bar-lines . 0) default-frame-alist)
      (push '(vertical-scroll-bars . nil) default-frame-alist)
      (push '(font . "Cica-14") default-frame-alist)
      (push '(fullscreen . maximized) initial-frame-alist)
    '';

    prelude = ''
      (require 'initchart)
      (initchart-record-execution-time-of load file)
      (initchart-record-execution-time-of require feature)
      (setq backup-directory-alist `((".*" . ,temporary-file-directory))
            auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
            auto-save-list-file-prefix nil
            read-process-output-max (* 3 1024 1024))
      (require 'general)
      (require 'hydra)
    '';

    postlude = ''
      (load "${./hydrae.el}")
      (load "${./keybinds.el}")
    '';
  };
}
