{ config, lib, pkgs, ... }:
{
  options = {};
  config = {
     services.blueman.enable = true;

     services.pipewire = {
       enable = true;
       alsa.enable = true;
       alsa.support32Bit = true;
       pulse.enable = true;
       jack.enable = true;

     };

     virtualisation.docker = {
       enable = true;
       rootless = {
        enable = true;
        setSocketVariable = true;
       };
     };
 
  };
}

