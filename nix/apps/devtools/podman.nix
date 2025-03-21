{ pkgs, username, ... }:

{
  # Enable common container config files in /etc/containers
  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  users.users.${username}.extraGroups = [ "podman" ];

  # Useful tools
  environment.systemPackages = with pkgs; [
    dive
    podman-tui
    podman-compose
    podman-desktop
  ];
}
