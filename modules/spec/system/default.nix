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

      font = lib.mkOption {
        type = lib.types.str;  
        default = "Lat2-Terminus16";
        description = "System console locale";
      };

      isExperimental = lib.mkOption {
        type = lib.types.bool;  
        default = true; 
        description = "Enable NixOS experimental features";
      };

      isLibInput = lib.mkOption {
        type = lib.types.bool;  
        default = false; 
        description = "Enable input library";
      };

      locale = lib.mkOption {
        type = lib.types.str;  
        default = "en_US.UTF-8";
        description = "System international locale";
      };

      name = lib.mkOption {
        type = lib.types.str;  
        default = "default";
        description = "System host name";
      };

      timezone = lib.mkOption {
        type = lib.types.str;  
        default = "UTC";
        description = "System clock time zone";
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

    console = {
      font = config.spec.system.font;
      keyMap = "us";
    };
    
    i18n.defaultLocale = "en_US.UTF-8";

    networking.hostName = config.spec.system.name;

    nix.settings.experimental-features = lib.mkIf config.spec.system.isExperimental
      [
        "nix-command"
        "flakes"
      ];

    services.libinput.enable = config.spec.system.isLibInput;

    time.timeZone = config.spec.system.timezone;
  };
}
