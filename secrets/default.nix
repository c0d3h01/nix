{
  inputs,
  config,
  ...
}:

{
  sops = {
    age = {
      keyFile = "${config.home.homeDirectory}/.config/sops/sops-secrets-key.txt";
      sshKeyPaths = [
        "${config.home.homeDirectory}/.ssh/id_ed25519"
      ];
    };

    secrets = {
      # "element" = {
      #   sopsFile = ;
      #   path = "/${config.home.homeDirectory}/.secrets/passwd";
      #   format = "binary";
      # }
    };
  };
}
