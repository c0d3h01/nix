{
  inputs,
  pkgs,
  declarative,
  ...
}:

{
  imports = [
    inputs.agenix.nixosModules.default
  ];

  age = {
    identityPaths = [
      "/home/${declarative.username}/.ssh/id_ed25519"
      "/etc/ssh/ssh_host_ed25519_key"
    ];

    secrets = {
      ssh-key.file = ./ssh-key.age;
      element-key.file = ./element-key.age;
    };
  };
}
