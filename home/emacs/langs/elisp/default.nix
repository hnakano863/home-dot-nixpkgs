{ config, pkgs, lib, ... }:
{
  programs.emacs.init.usePackage = {
    company.hook = [
      "(emacs-lisp-mode . company-mode)"
    ];

    smartparens.hook = [
      "(emacs-lisp-mode . smartparens-mode)"
    ];
    smartparens.command = [
      "sp-wrap-round"
      "sp-wrap-square"
      "sp-wrap-curly"
      "sp-wrap-with-pair"
    ];
  };

  programs.emacs.init.postlude = lib.mkAfter ''
    (load "${./keybinds.el}")
  '';
}
