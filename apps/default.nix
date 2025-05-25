{
  pkgs,
  ...
}:

{
  imports = [
    ./tools
  ];

  # Enable flatpak repo : flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  # services.flatpak.enable = true;

  programs.appimage.enable = true;
  # programs.adb.enable = true;

  myModules = {
    # docker.enable = true;
    # monitoring.enable = true;
    # mysql.enable = true;
    # podman.enable = true;
    python.enable = true;
    r.enable = true;
    rust.enable = true;
  };

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
    dumpcap.enable = true;
    usbmon.enable = true;
  };

  # Environment packages
  environment.systemPackages =
    let
      Apps = with pkgs; [
        # Browser
        firefox

        # Developement tools
        nodejs
        yarn
        electron
        gdb
        glib
        gcc
        clang
        gnumake
        cmake
        ninja
        clang-tools
        pkg-config
      ];
    in
    Apps;
}
