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
      extraConfig = ''
        :custom
        (jupyter-executable "${pyWithJupyter}/bin/jupyter")
      '';
      config = ''
        (defun my/jupyter-command-advice (orig-fun &rest args)
          (with-temp-buffer
            (when (zerop (apply #'process-file jupyter-executable nil t nil args))
              (string-trim-right (buffer-string)))))
        (advice-add 'jupyter-command :around #'my/jupyter-command-advice)
      '';
    };
  };
}
