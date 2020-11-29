self: super:
let
  environment-el = with super; runCommand "environment.el" {
    jisyo = skk-dicts;
    inherit cmigemo;
    inherit (python3Packages) python;
  } ''substituteAll ${./environment.el.in} $out'';
  
  generic-el = builtins.readFile ./generic.el;
  packages-el = builtins.readFile ./packages.el;
  hydrae-el = builtins.readFile ./hydrae.el;
  keybinds-el = builtins.readFile ./keybinds.el;

  default-el = super.writeText "default.el" ''
    (load "${environment-el}")
    ${generic-el}
    ${packages-el}
    ${hydrae-el}
    ${keybinds-el}
  '';

  siteLispSetup = super.runCommand "default.el" {} ''
    mkdir -p $out/share/emacs/site-lisp
    cp ${default-el} $out/share/emacs/site-lisp/default.el
  '';

  overrides = import ./overrides;
in
{
  emacs = with super;
    ((emacsPackagesFor emacs).overrideScope' overrides).emacsWithPackages
      (epkgs: with epkgs; [
        siteLispSetup
        # my-ivy-migemo
    
        use-package
        evil
        hydra
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
        smartparens
        ddskk
        migemo
  
        nix-mode
        fish-mode
      ]
    );
}
