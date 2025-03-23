{ config, pkgs, username, ... }:

{
  imports = [
    ./apps
    ./c0d3h01
    ./hardware.nix
    ./optimization.nix
  ];

  # -*-[ Bootloader Configuration ]-*-
  boot = {
    tmp.cleanOnBoot = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  
  # Zen kernel for better performance
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Hardware acceleration for video rendering
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # -*-[ GPG ]-*-
  # Some programs need SUID wrappers, can be configured further or are
  # programs.mtr.enable = true;
  programs = {
    gnupg.agent.enable = true;
    gnupg.agent.enableSSHSupport = false;
  };

  # -*-[ SSH ]-*-
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      X11Forwarding = true;
      AllowUsers = [ "${username}" ];
    };
  };

  # -*-[ Systemd logs ]-*-
  services.journald = {
    extraConfig = ''
      SystemMaxUse=500M
      SystemMaxFiles=10
    '';
    rateLimitBurst = 2000;
    rateLimitInterval = "60s";
  };
}
