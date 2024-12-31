{ config, lib, pkgs, ...}:
{
  options = {
    spec.network = {
      isManaged = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable network manager";
      };
    };
  };
  
  config = {
    networking = lib.mkIf config.spec.network.isManaged {
      networkmanager.enable = true;
    };
    environment.systemPackages = lib.mkIf config.spec.network.isManaged (with pkgs; [
      networkmanager
    ]);
  };
}
