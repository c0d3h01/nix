<!--  -->
# localhost dotfiles

[![Linux](https://img.shields.io/badge/Linux-cad3f5?style=for-the-badge&logo=linux&logoColor=black)](https://github.com/khaneliman/dotfiles/blob/main/dots/linux/)

## Clean installation

```
# Clone the repository
git clone https://github.com/c0d3h01/dot-files.git
cd dot-files

# Partition and format disk with Disko
sudo nix --experimental-features "nix-command flakes" run \
  github:nix-community/disko/latest -- \
  --mode destroy,format,mount ./systems/c0d3h01/disko-btrfs.nix

# Only for low ram devices!
sudo btrfs filesystem mkswapfile --size 8G /mnt/swapfile
sudo chmod 600 /mnt/swapfile
sudo swapon /mnt/swapfile

# Install NixOS
sudo nixos-install --flake '.#c0d3h01' --no-root-passwd
```

## Troubleshooting

```
sudo mount -o subvol=@ /dev/nvme0n1p2 /mnt
sudo mount -o subvol=@home /dev/nvme0n1p2 /mnt/home
sudo mount -o subvol=@nix /dev/nvme0n1p2 /mnt/nix
sudo mount -o subvol=@srv /dev/nvme0n1p2 /mnt/srv
sudo mount -o subvol=@cache /dev/nvme0n1p2 /mnt/var/cache
sudo mount -o subvol=@tmp /dev/nvme0n1p2 /mnt/var/tmp
sudo mount -o subvol=@log /dev/nvme0n1p2 /mnt/var/log

sudo mount /dev/nvme0n1p1 /mnt/boot

sudo nixos-enter --root /mnt
```
