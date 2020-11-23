self: super:
let
  environment-el = super.runCommand "environment.el" {
    inherit (super.python3Packages) python;
  } ''substituteAll ${./environment.el.in} $out'';
  
  generic-el = builtins.readFile ./generic.el;
  packages-el = builtins.readFile ./packages.el;
  keybinds-el = builtins.readFile ./keybinds.el;

  default-el = super.writeText "default.el" ''
    (load "${environment-el}")
    ${generic-el}
    ${packages-el}
    ${keybinds-el}
  '';

  siteLispSetup = super.runCommand "default.el" {} ''
    mkdir -p $out/share/emacs/site-lisp
    cp ${default-el} $out/share/emacs/site-lisp/default.el
  '';
in {
  emacs = super.emacsWithPackages (epkgs: with epkgs;
    (super.lib.lists.singleton siteLispSetup) ++ [
      use-package
      evil
      undo-fu
      undo-fu-session

      general
      which-key
      counsel
      restart-emacs
      winum

      git-gutter
      magit
      evil-magit
      treemacs
      treemacs-evil

      vterm
      vterm-toggle

      nix-mode
      fish-mode
    ]
  );
}
