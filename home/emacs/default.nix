{ config, pkgs, lib, ... }:
with lib;
let
  readFile = builtins.readFile;
in
{
  imports = [ ./packages_debug.nix ];
  programs.emacs.enable = true;
  programs.emacs.overrides = import ./overrides;
  programs.emacs.init = {
    enable = true;
    startupTimer = true;

    recommendedGcSettings = true;

    prelude = ''
      ;(require 'initchart)
      ;(initchart-record-execution-time-of load file)
      ;(initchart-record-execution-time-of require feature)
      (load "${./generic.el}")
      (require 'general)
      (require 'hydra)
    '';
    
    postlude = ''
      ;(load "${./hydrae.el}")
      (load "${./keybinds.el}")
    ''; 
  };
}
