{ lib
, ...
}:
{
  services.resolved.enable = true;
  systemd.network.wait-online.enable = false;
  networking = {
    networkmanager = {
      enable = true;
      wifi.powersave = false;
    };
    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];
    firewall = {
      enable = true;
      # allowPing = true;

      # TCP Ports
      allowedTCPPorts = [
        22 # SSH (Secure Shell) - Remote access
        80 # HTTP - Web traffic
        443 # HTTPS - Secure web traffic
        53 # DNS - Domain Name System resolution
        123 # NTP - Network Time Protocol (Time sync)
        3389 # RDP - Remote Desktop Protocol (Windows)
        20 # FTP - Data transfer
        21 # FTP - Command control
        445 # SMB - Windows File Sharing
        137 # NetBIOS Name Service
        138 # NetBIOS Datagram Service
        139 # NetBIOS Session Service
        3306 # MySQL - Database access
        5432 # PostgreSQL - Database access
        27017 # MongoDB - Database access
        2375 # Docker API (Unsecured)
        2376 # Docker API (Secured)
        1716 # gsconnect
      ];

      # UDP Ports
      allowedUDPPorts = [
        53 # DNS - Domain Name System
        123 # NTP - Network Time Protocol (Time sync)
        1716 # gsconnect 
      ];
    };
  };
}
