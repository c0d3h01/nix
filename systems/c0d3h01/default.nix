{
  imports = [
    ./disko-btrfs.nix
    ./users.nix
  ];

  garden = {
    # Gnome Environment
    programs.gnome.enable = true;

    profiles = {
      laptop.enable = true;
      graphical.enable = true;
      workstation.enable = true;
    };

    device = {
      cpu = "amd";
      gpu = "amd";
      keyboard = "us";
      capabilities = {
        tpm = true;
        # bluetooth = true;
      };
    };

    system = {
      boot = {
        loader = "grub";
        secureBoot = false;

        loadRecommendedModules = true;
        enableKernelTweaks = true;

        silentBoot = false;

        initrd = {
          enableTweaks = true;
          optimizeCompressor = true;
        };
      };

      bluetooth.enable = true;
      printing.enable = false;

      security = {
        fixWebcam = false;
        auditd.enable = true;
      };

      networking = {
        optimizeTcp = true;
      };
    };
  };
}
