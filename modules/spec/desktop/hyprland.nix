{ config, lib, pkgs, ... }:
{
  options = {};
  config = {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.systemPackages = with pkgs; [
      wofi
      swww
      waybar
      font-awesome
      nerd-font-patcher
      cava
    ];

    fonts.packages = with pkgs; [
      font-awesome
      nerd-font-patcher
    ];

#     environment.sessionVariables = {
#       WLR_NO_HARDWARE_CURSORS = "1";
#       NIXOS_OZONE_WL = "1";
#     };
# 
#     environment.systemPackages = with pkgs; [
#       waybar
#       dunst
#       libnotify
#       rofi-wayland
#       swww
#     ];
# 
#     security.rtkit.enable = true;
#     services.pipewire = {
#       enable = true;
#       alsa.enable = true;
#       alsa.support32Bit = true;
#       pulse.enable = true;
#       jack.enable = true;
#     };

  };
}

