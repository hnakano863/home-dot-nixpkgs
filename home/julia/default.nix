{ config, pkgs, lib, ... }:
with pkgs;
with lib;
let
  pythonWithJupyter = python38.withPackages (p: [ p.notebook ]);
  startup-jl = runCommand "startup.jl" { inherit pythonWithJupyter; } ''
    substituteAll "${./startup.jl.in}" $out
  '';
in
{
  home.packages = [
    julia-bin
  ];

  home.file.".julia/config/startup.jl".source = startup-jl;
}
