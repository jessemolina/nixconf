{ config, lib, pkgs, ... }:
let 
  secrets = builtins.fromTOML (builtins.readFile ../../secrets/credentials.toml);
in
{
  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/spec/default.nix
    ];
  
  spec.system = {
    name = "regulus";
    isLibInput = true;
    timezone = "America/Chicago";
  };

  spec.users.user = {
    name = "jesse";
    hash = secrets.users.jesse.hash;
    isAdmin = true;
    shell = "nu";
  };

  spec.network = {
    isManaged = true;
  };

  # spec.applications = {
  #   documents.enable = true;
  #   internet.enable = true;
  #   media.enable = true;
  # }

  # Do NOT change this value; it defines the first version of NixOS installed on this particular machine.
  system.stateVersion = "24.05"; # Did you read the comment?
}
