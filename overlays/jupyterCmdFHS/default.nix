self: super:
let
  jupyterPath = super.jupyter-kernel.create { };

  pyPkgOverrides = pyself: pysuper: {
    jupyter_core = pysuper.jupyter_core.overridePythonAttrs (
      old: {
        makeWrapperArgs = [
          "--set JUPYTER_PATH ${jupyterPath}"
        ];
      }
    );
    notebook = pysuper.notebook.overridePythonAttrs (
      old: {
        doCheck = false;
      }
    );
  };

  customPython = super.python3.override {
    packageOverrides = pyPkgOverrides;
  };

  pythonWithJupyter = customPython.withPackages (
    ps: [ ps.notebook ]
  );
in
{
  jupyterCmdFHS = super.buildFHSUserEnv {
    name = "jupyter-command";
    targetPkgs = pkgs: with pkgs; [ pythonWithJupyter ];
    runScript = "jupyter";
  };
}
