{ config, lib, pkgs, ... }:
{
  config = {
    # services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia.modesetting.enable = true;
    hardware.nvidia.prime = {
      sync.enable = true;
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
