{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  # boot.kernelModules = [ "kvm-intel" "nvidiaLegacy390" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
  boot.initrd.availableKernelModules = [ "ehci_pci" "ahci" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    version = 2;
    useOSProber = true;
    efiSupport = true;
    device = "nodev";
  };
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/9283eccb-9044-42ab-9eb6-bef7b4be81f9";
      fsType = "btrfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/17B1-D86B";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/1a46b975-a6c2-464f-bccc-8134ddbc5dfd"; }
    ];

  nix.maxJobs = lib.mkDefault 2;
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  time = {
    timeZone = "Europe/Madrid";
    hardwareClockInLocalTime = true;
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.ledger.enable = true;
  hardware.nvidia.prime = {
    # sync.enable = true;
    # offload.enable = true;
    nvidiaBusId = "PCI:1:0:0";
    intelBusId = "PCI:0:2:0";
  };
  # hardware.opengl = {
  #   driSupport32Bit = true;
  #   extraPackages = [
  #     pkgs.libGL_driver
  #     pkgs.linuxPackages.nvidia_x11_legacy390.out
  #   ];
  # };
}

