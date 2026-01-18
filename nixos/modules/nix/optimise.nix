{pkgs, ...}: {
  nix = {
    # Automatic store GC
    gc = {
      automatic = true;
      options = "--delete-older-than 3d";
    };

    # Periodic hard‑link dedup
    optimise.automatic = true;
  };
}
