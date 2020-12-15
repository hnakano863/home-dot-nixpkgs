{
  allowUnfree = true;
  packageOverrides = pkgs: {
    pythonWithJupyter = let
      customPython = let
        jupyterPath = pkgs.jupyter-kernel.create { };
        packageOverrides = self: super: {
          jupyter_core = super.jupyter_core.overridePythonAttrs (
            old: {
              makeWrapperArgs = [ "--set JUPYTER_PATH ${jupyterPath}" ];
            }
          );
        };
      in pkgs.python3.override { inherit packageOverrides; };
    in customPython.withPackages (ps: [ ps.notebook ]);
  };
}
