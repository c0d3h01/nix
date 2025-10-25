# Troubleshooting NixOS Enter with Btrfs Subvolumes

When using `nixos-enter` on a NixOS system that utilizes Btrfs subvolumes, it's essential to ensure that the correct subvolumes are mounted properly before entering the environment. Below are the steps to troubleshoot and correctly mount the necessary subvolumes.

```
# Mount root subvolume (@)
sudo mount -o subvol=@,noatime,compress=zstd:1,ssd,space_cache=v2,commit=120 /dev/nvme0n1p3 /mnt

# Mount Nix store subvolume (@nix)
sudo mkdir -p /mnt/nix
sudo mount -o subvol=@nix,noatime,compress=zstd:7,ssd,space_cache=v2,commit=120 /dev/nvme0n1p3 /mnt/nix

# Mount boot partition (EFI)
sudo mkdir -p /mnt/boot
sudo mount -o defaults,umask=0077 /dev/nvme0n1p1 /mnt/boot

# Optional: mount home subvolume (@home) if you want user files
sudo mkdir -p /mnt/home
sudo mount -o subvol=@home,noatime,compress=zstd:1,ssd,space_cache=v2,commit=120 /dev/nvme0n1p3 /mnt/home

sudo nixos-enter --root /mnt
```