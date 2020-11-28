self: super:
let
  jisyo = super.fetchurl {
    name = "SKK-JISYO.L";
    url = "https://skk-dev.github.io/dict/SKK-JISYO.L.gz";
    sha256 = "0ps0a7sbkryd6hxvphq14i7g5wci4gvr0vraac8ia2ww67a2xbyc";
    downloadToTemp = true;
    postFetch = ''
      ${super.gzip}/bin/gzip -cd $downloadedFile > $out
    '';
  };

  environment-el = super.runCommand "environment.el" {
    inherit jisyo;
    inherit (super.python3Packages) python;
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
in {
  emacs = super.emacsWithPackages (epkgs: with epkgs;
    [
      siteLispSetup
      
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

      nix-mode
      fish-mode
    ]
  );
}
