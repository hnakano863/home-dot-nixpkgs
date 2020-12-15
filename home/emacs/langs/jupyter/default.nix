{ config, pkgs, lib, ... }:
with pkgs;
with lib;
let
  pyWithJupyter = python38.withPackages (p: [ p.notebook ]);
in
{
  programs.emacs.init.usePackage = {
    jupyter = {
      enable = true;
      command = [
        "jupyter-run-repl"
        "jupyter-available-kernelspecs"
      ];
      extraConfig = ''
        :custom
        (jupyter-executable "${pyWithJupyter}/bin/jupyter")
      '';
      init = readFile ./jupyter-init.el;
    };

    ein-jupyter = {
      enable = true;
      package = "ein";
      command = [ "ein:run" ];
      extraConfig = ''
        :custom
        (ein:jupyter-server-command "${pyWithJupyter}/bin/jupyter")
      '';
    };
  };
}
