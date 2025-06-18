{ inputs, pkgs, ... }:

{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
}
