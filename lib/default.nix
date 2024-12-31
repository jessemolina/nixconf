{ lib }:
{
  # config = {
  # }; 

  mkSystem = { system, configuration, hardware }:
    lib.nixosSystem {
      inherit system;
      modules = [
        configuration
        hardware
        { nixpkgs.config.allowUnfree = true; }
      ];
     };
}
