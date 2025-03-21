{ ... }:

{
  boot.kernelParams = [
    # CPU Performance
    "processor.max_cstate=1" # Prevents deep sleep states, improving responsiveness
    "amd_iommu=on" # Enable AMD IOMMU
    "idle=nomwait" # Disable MWAIT for CPU idle states
    "mitigations=off" # Disables security mitigations for better raw performance
    "amd_pstate=active" # Uses AMD's new performance scaling

    # GPU Performance (AMD Vega)
    "amdgpu.ppfeaturemask=0xffffffff" # Enable power features
    "amdgpu.dc=1" # Enable Display Core (DC)

    # I/O Performance
    "elevator=none" # I/O scheduler, nvme (none), HDD (cfq)
    "scsi_mod.use_blk_mq=1" # Enable multi-queue for SCSI devices

    # Network Performance
    "net.core.netdev_max_backlog=8192" # Moderate network backlog
    "net.core.somaxconn=1024" # Moderate socket connection limit
    "net.ipv4.tcp_fastopen=1" # Enable TCP Fast Open for clients only

    # Memory Management
    "vm.swappiness=5" # Reduce swap usage
    "vm.dirty_ratio=20" # Write dirty pages to disk later
    "vm.dirty_background_ratio=10" # Moderate background writeback threshold
  ];
}
