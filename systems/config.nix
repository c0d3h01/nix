{
  c0d3h01 = {
    username = "c0d3h01";
    hostname = "nixos";
    fullName = "Harshal Sawant";
    system = "x86_64-linux";

    machineConfig = {
      type = "laptop"; # Options = "laptop" | "server"
      workstation = true; # Proper GUI support & apps
      bootloader = "systemd"; # Options = "systemd" | "grub"
      cpuType = "amd"; # Options = "amd" | "intel"
      gpuType = "amd"; # Options = "amd" | "nvidia" | "intel"
      networking.wireless = false;
      networking.backend = "iwd"; # Options = "iwd" | "wpa_supplicant"
      windowManager = "gnome"; # Options = "gnome" | "kde"
    };

    devStack = {
      ollama = true;
      tabby = false;
      virtualisation = true; # VM
      wine = false; # WinApps with 32 bit support
      monitoring = false; # Monitoring grouped tools
      container = "podman"; # Options = "docker" | "podman"
      db = true; # Mysql - DBMS
    };
  };
}
