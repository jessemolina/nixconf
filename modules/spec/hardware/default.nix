{ config, lib, pkgs, ... }:
{
  imports = [
    ./nvidia.nix
  ];


  options = {};
  config = {
    hardware.graphics = {
      enable = true;
      # driSupport32Bit = true;
    };

    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
  };
}

