# Encrypt volumes configuration
{ config, pkgs, ... }:

let
  PRIMARYUSBID = "47A7-7639";
  CRYPTOCONFIG = 
   { keyFile = "/key/nixos.key";
     preLVM = false;
     fallbackToPassword = true;
   };
in {
  # Kernel modules needed for mounting USB VFAT devices in initrd stage
  boot.initrd.kernelModules = ["uas" "usbcore" "usb_storage" "vfat" "nls_cp437" "nls_iso8859_1"];

  # Mount USB key before trying to decrypt root filesystem
  boot.initrd.postDeviceCommands = pkgs.lib.mkBefore ''
    mkdir -m 0755 -p /key
    sleep 2 # To make sure the usb key has been loaded
    mount -n -t vfat -o ro `findfs UUID=${PRIMARYUSBID}` /key
  '';

  boot.initrd.luks.devices."cryptednvme" = (CRYPTOCONFIG // {device = "/dev/disk/by-uuid/5d4245dc-9dc2-4f86-a575-fe59adbbc1f6";});
  boot.initrd.luks.devices."cryptedsda" = (CRYPTOCONFIG // {device = "/dev/disk/by-uuid/f8a82b10-c6f8-4e8a-94be-d20e46ce491d";});
}
