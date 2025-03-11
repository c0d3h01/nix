{ pkgs
, ...
}:

{
  environment.systemPackages = with pkgs; [
    # Python environment modules
    python312Full
    python312Packages.pip
    python312Packages.django
    python312Packages.flask

    # Jupyter lab
    python312Packages.jupyterlab

    # Type checker but also provides the main LSP functionality.
    pyright

    # Formatter and linter with LSP integration.
    ruff
  ];
}

