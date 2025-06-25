{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  name = "Node Dev Shell";
  buildInputs = with pkgs; [
    nodejs
    yarn
    eslint
    prettierd
  ];
  # shellHook = ''
  # '';
}
