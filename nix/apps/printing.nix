{ pkgs, ... }:

{
  # -*- Enable printing -*-
  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.openFirewall = true;
  networking.firewall.allowedTCPPorts = [ 631 ];
}
