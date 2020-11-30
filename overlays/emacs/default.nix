self: super:
let
  environment-el = with super; runCommand "environment.el" {
    jisyo = skk-dicts;
    inherit cmigemo;
    inherit (python3Packages) python;
  } ''substituteAll ${./environment.el.in} $out'';

  default-el = super.writeText "default.el" ''
    (require 'initchart)
    (initchart-record-execution-time-of load file)
    (initchart-record-execution-time-of require feature)
    (setq gc-cons-threshold most-positive-fixnum)
    (load "${environment-el}")
    (load "${./generic.el}")
    (load "${./packages.el}")
    (load "${./hydrae.el}")
    (load "${./keybinds.el}")
    (setq gc-cons-threshold 16777216)
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
        my-ivy-migemo
    
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
        eshell-toggle
        smartparens
        ddskk
        migemo
  
        doom-themes
        doom-modeline
        all-the-icons
        treemacs-all-the-icons
        ivy-rich
        
        nix-mode
        fish-mode

        initchart
      ]
    );
}
