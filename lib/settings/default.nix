{ config, lib, pkgs, ... }:
{
  options = {
    spec.system = {
       boot = {
        loader = lib.mkOption {
          type = lib.types.str;
          default = "systemd-boot";
          description = "System boot loader";
        };
        
        mount = lib.mkOption {
	  type = lib.types.str;
          default = "/boot";
          description = "System boot mount";
        };
      };
    };
   
  };
 
  config = {
    boot.loader = 
    if config.spec.system.boot.loader == "systemd-boot" then
    {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = config.spec.system.boot.mount; 
    } else 
        throw "Unsupported boot loader ${config.spec.system.boot.loader}";
  };
}
