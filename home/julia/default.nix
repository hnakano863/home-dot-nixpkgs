{ config, pkgs, lib, ... }:
with pkgs;
with lib;
let
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
