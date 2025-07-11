{ inputs, ... }:

{
  imports = [
    inputs.disko.nixosModules.disko

    # Desktop environment
    ../desktop/gnome.nix

    # Hardware configuration
    ../hardware/amd.nix
    ../hardware/btrfs-maintence.nix
    ../hardware/disko-btrfs.nix
    ../hardware/firmware.nix

    # Networking configuration
    ../networking/dns.nix
    ../networking/network.nix
    ../networking/optimizations.nix
    ../networking/ssh.nix

    # NixOS configuration
    ../nix/config.nix
    ../nix/nix-ld.nix
    ../nix/nix-settings.nix

    # Programs configuration
    ../programs/apps.nix
    # ../programs/docker.nix
    # ../programs/mysql.nix
    ../programs/podman.nix
    ../programs/wireshark.nix

    # Security configuration
    ../security/firewall.nix
    ../security/siteblocker.nix

    # Services configuration
    ../services/acpid.nix
    ../services/ananicy.nix
    ../services/appImage.nix
    ../services/earlyoom.nix
    # ../services/flatpak.nix
    # ../services/libvirt.nix
    ../services/oomd.nix
    ../services/pager.nix
    ../services/udevRules.nix

    # System configuration
    ../system/audio.nix
    ../system/docs.nix
    ../system/power.nix
    # ../system/printing.nix
  ];
}
