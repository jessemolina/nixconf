{ config, lib, pkgs, ... }:
{
  options = {};
  config = {
    programs.sway = {
      enable = true;
    };
  };
}
