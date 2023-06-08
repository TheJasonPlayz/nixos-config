# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/fae18a1a-2493-4de7-8a8c-6e6ef0b72bf1";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/7CA4-A320";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/dc91bbff-5a00-49d7-8202-4ef98a9935ec";
      fsType = "xfs";
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/76f7a708-432d-420a-9469-9947f5b5fad7";
      fsType = "xfs";
    };

  fileSystems."/opt" =
    { device = "/dev/disk/by-uuid/88556b81-f146-4e94-ae52-8a9a2a4b33c5";
      fsType = "ext4";
    };

  fileSystems."/tmp" =
    { device = "/dev/disk/by-uuid/04b63ddf-087b-451a-bf19-1bc370880aec";
      fsType = "ext4";
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/ad94ff88-c7aa-444c-9ee6-b43a3a0c1cbf";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/7ff3f990-713c-415d-b1d8-bcd6df069727"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp34s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp36s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
