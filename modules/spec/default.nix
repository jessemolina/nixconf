{config, hw, lib, pkgs, ...}:
{
  imports = [
    ./applications/default.nix
    ./desktop/default.nix
    ./hardware/default.nix
    ./network/default.nix
    ./services/default.nix
    ./system/default.nix
    ./users/default.nix
  ];

  options = {
     spec = {
       system.enable = lib.mkOption {
         type = lib.types.bool;
         default = true;
         description = "Specify system configuration";
       };

       users.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Specify user configuration";
       }; 
     };
  };

  # TODO: Define logic to determine whether to include spec modules conditionally.
}
